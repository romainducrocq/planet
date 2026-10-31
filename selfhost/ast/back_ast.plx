m4_include(`ast.plx.m4')m4_dnl
m4_include(`back_ast.plx.m4')m4_dnl
m4_include(`back_symt.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

pub fn make_AsmReg(tagged_def_impl(AST_T)) struc AsmReg {
    self: struc AsmReg = $(tag)
    match tag {
        -> AST_AsmReg_t {
            -> AST_AsmAx_t {
                -> AST_AsmBx_t {
                    -> AST_AsmCx_t {
                        -> AST_AsmDx_t {
                            -> AST_AsmDi_t {
                                -> AST_AsmSi_t {
                                    -> AST_AsmR8_t {
                                        -> AST_AsmR9_t {
                                            -> AST_AsmR10_t {
                                                -> AST_AsmR11_t {
                                                    -> AST_AsmR12_t {
                                                        -> AST_AsmR13_t {
                                                            -> AST_AsmR14_t {
                                                                -> AST_AsmR15_t {
                                                                    -> AST_AsmSp_t {
                                                                        -> AST_AsmBp_t {
                                                                            -> AST_AsmXMM0_t {
                                                                                -> AST_AsmXMM1_t {
                                                                                    -> AST_AsmXMM2_t {
                                                                                        -> AST_AsmXMM3_t {
                                                                                            -> AST_AsmXMM4_t {
                                                                                                -> AST_AsmXMM5_t {
                                                                                                    -> AST_AsmXMM6_t {
                                                                                                        -> AST_AsmXMM7_t {
                                                                                                            -> AST_AsmXMM8_t {
                                                                                                                -> AST_AsmXMM9_t {
                                                                                                                    -> AST_AsmXMM10_t {
                                                                                                                        -> AST_AsmXMM11_t {
                                                                                                                            -> AST_AsmXMM12_t {
                                                                                                                                -> AST_AsmXMM13_t {
                                                                                                                                    -> AST_AsmXMM14_t {
                                                                                                                                        -> AST_AsmXMM15_t {
                                                                                                                                            return self
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
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_AsmCondCode(tagged_def_impl(AST_T)) struc AsmCondCode {
    self: struc AsmCondCode = $(tag)
    match tag {
        -> AST_AsmCondCode_t {
            -> AST_AsmE_t {
                -> AST_AsmNE_t {
                    -> AST_AsmG_t {
                        -> AST_AsmGE_t {
                            -> AST_AsmL_t {
                                -> AST_AsmLE_t {
                                    -> AST_AsmA_t {
                                        -> AST_AsmAE_t {
                                            -> AST_AsmB_t {
                                                -> AST_AsmBE_t {
                                                    -> AST_AsmP_t {
                                                        return self
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
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_AsmOperand(none) *struc AsmOperand {
    self: *struc AsmOperand = sptr_new()
    sptr_alloc(AsmOperand, self)
    self[].tag = AST_AsmOperand_t
    return self
}

pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmImm_t
    self[].get._AsmImm.value = value
    self[].get._AsmImm.is_byte = is_byte
    self[].get._AsmImm.is_quad = is_quad
    self[].get._AsmImm.is_neg = is_neg
    return self
}

pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmRegister_t
    self[].get._AsmRegister.reg = reg[]
    return self
}

pub fn make_AsmPseudo(name: u64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudo_t
    self[].get._AsmPseudo.name = name
    return self
}

pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmMemory_t
    self[].get._AsmMemory.value = value
    self[].get._AsmMemory.reg = reg[]
    return self
}

pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmData_t
    self[].get._AsmData.name = name
    self[].get._AsmData.offset = offset
    return self
}

pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudoMem_t
    self[].get._AsmPseudoMem.name = name
    self[].get._AsmPseudoMem.offset = offset
    return self
}

pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmIndexed_t
    self[].get._AsmIndexed.scale = scale
    self[].get._AsmIndexed.reg_base = reg_base[]
    self[].get._AsmIndexed.reg_index = reg_index[]
    return self
}

pub fn free_AsmOperand(self: **struc AsmOperand) none {
    sptr_delete(self[])
    match (self[])[].tag {
        -> AST_AsmOperand_t {
            -> AST_AsmImm_t {
                break
            }
        }
        -> AST_AsmRegister_t {
            break
        }
        -> AST_AsmPseudo_t {
            break
        }
        -> AST_AsmMemory_t {
            break
        }
        -> AST_AsmData_t {
            break
        }
        -> AST_AsmPseudoMem_t {
            break
        }
        -> AST_AsmIndexed_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    sptr_free(self[])
}

pub fn make_AsmBinaryOp(tagged_def_impl(AST_T)) struc AsmBinaryOp {
    self: struc AsmBinaryOp = $(tag)
    match tag {
        -> AST_AsmBinaryOp_t {
            -> AST_AsmAdd_t {
                -> AST_AsmSub_t {
                    -> AST_AsmMult_t {
                        -> AST_AsmDivDouble_t {
                            -> AST_AsmBitAnd_t {
                                -> AST_AsmBitOr_t {
                                    -> AST_AsmBitXor_t {
                                        -> AST_AsmBitShiftLeft_t {
                                            -> AST_AsmBitShiftRight_t {
                                                -> AST_AsmBitShrArithmetic_t {
                                                    return self
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
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_AsmUnaryOp(tagged_def_impl(AST_T)) struc AsmUnaryOp {
    self: struc AsmUnaryOp = $(tag)
    match tag {
        -> AST_AsmUnaryOp_t {
            -> AST_AsmNot_t {
                -> AST_AsmNeg_t {
                    -> AST_AsmShr_t {
                        return self
                    }
                }
            }
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_AsmInstruction(none) *struc AsmInstruction {
    self: unique_ptr_t(AsmInstruction) = uptr_new()
    uptr_alloc(AsmInstruction, self)
    self[].tag = AST_AsmInstruction_t
    return self
}

pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMov_t
    self[].get._AsmMov.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmMov.asm_type)
    self[].get._AsmMov.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmMov.src)
    self[].get._AsmMov.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmMov.dst)
    return self
}

pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovSx_t
    self[].get._AsmMovSx.asm_type_src = sptr_new()
    sptr_move(AssemblyType, asm_type_src[], self[].get._AsmMovSx.asm_type_src)
    self[].get._AsmMovSx.asm_type_dst = sptr_new()
    sptr_move(AssemblyType, asm_type_dst[], self[].get._AsmMovSx.asm_type_dst)
    self[].get._AsmMovSx.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmMovSx.src)
    self[].get._AsmMovSx.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmMovSx.dst)
    return self
}

pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovZeroExtend_t
    self[].get._AsmMovZeroExtend.asm_type_src = sptr_new()
    sptr_move(AssemblyType, asm_type_src[], self[].get._AsmMovZeroExtend.asm_type_src)
    self[].get._AsmMovZeroExtend.asm_type_dst = sptr_new()
    sptr_move(AssemblyType, asm_type_dst[], self[].get._AsmMovZeroExtend.asm_type_dst)
    self[].get._AsmMovZeroExtend.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmMovZeroExtend.src)
    self[].get._AsmMovZeroExtend.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmMovZeroExtend.dst)
    return self
}

pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLea_t
    self[].get._AsmLea.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmLea.src)
    self[].get._AsmLea.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmLea.dst)
    return self
}

pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvttsd2si_t
    self[].get._AsmCvttsd2si.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmCvttsd2si.asm_type)
    self[].get._AsmCvttsd2si.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmCvttsd2si.src)
    self[].get._AsmCvttsd2si.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmCvttsd2si.dst)
    return self
}

pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvtsi2sd_t
    self[].get._AsmCvtsi2sd.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmCvtsi2sd.asm_type)
    self[].get._AsmCvtsi2sd.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmCvtsi2sd.src)
    self[].get._AsmCvtsi2sd.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmCvtsi2sd.dst)
    return self
}

pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmUnary_t
    self[].get._AsmUnary.unop = unop[]
    self[].get._AsmUnary.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmUnary.asm_type)
    self[].get._AsmUnary.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmUnary.dst)
    return self
}

pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmBinary_t
    self[].get._AsmBinary.binop = binop[]
    self[].get._AsmBinary.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmBinary.asm_type)
    self[].get._AsmBinary.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmBinary.src)
    self[].get._AsmBinary.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmBinary.dst)
    return self
}

pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCmp_t
    self[].get._AsmCmp.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmCmp.asm_type)
    self[].get._AsmCmp.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmCmp.src)
    self[].get._AsmCmp.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmCmp.dst)
    return self
}

pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmIdiv_t
    self[].get._AsmIdiv.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmIdiv.asm_type)
    self[].get._AsmIdiv.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmIdiv.src)
    return self
}

pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmDiv_t
    self[].get._AsmDiv.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmDiv.asm_type)
    self[].get._AsmDiv.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmDiv.src)
    return self
}

pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCdq_t
    self[].get._AsmCdq.asm_type = sptr_new()
    sptr_move(AssemblyType, asm_type[], self[].get._AsmCdq.asm_type)
    return self
}

pub fn make_AsmJmp(target: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmp_t
    self[].get._AsmJmp.target = target
    return self
}

pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmpCC_t
    self[].get._AsmJmpCC.target = target
    self[].get._AsmJmpCC.cond_code = cond_code[]
    return self
}

pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmSetCC_t
    self[].get._AsmSetCC.cond_code = cond_code[]
    self[].get._AsmSetCC.dst = sptr_new()
    sptr_move(AsmOperand, dst[], self[].get._AsmSetCC.dst)
    return self
}

pub fn make_AsmLabel(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLabel_t
    self[].get._AsmLabel.name = name
    return self
}

pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPush_t
    self[].get._AsmPush.src = sptr_new()
    sptr_move(AsmOperand, src[], self[].get._AsmPush.src)
    return self
}

pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPop_t
    self[].get._AsmPop.reg = reg[]
    return self
}

pub fn make_AsmCall(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCall_t
    self[].get._AsmCall.name = name
    return self
}

pub fn make_AsmRet(none) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmRet_t
    return self
}

pub fn free_AsmInstruction(self: **struc AsmInstruction) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_AsmInstruction_t {
            break
        }
        -> AST_AsmMov_t {
            free_AssemblyType(@(self[])[].get._AsmMov.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmMov.src)
        free_AsmOperand(@(self[])[].get._AsmMov.dst)
        break
        -> AST_AsmMovSx_t {
            free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovSx.src)
        free_AsmOperand(@(self[])[].get._AsmMovSx.dst)
        break
        -> AST_AsmMovZeroExtend_t {
            free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.src)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.dst)
        break
        -> AST_AsmLea_t {
            free_AsmOperand(@(self[])[].get._AsmLea.src)
        }
        free_AsmOperand(@(self[])[].get._AsmLea.dst)
        break
        -> AST_AsmCvttsd2si_t {
            free_AssemblyType(@(self[])[].get._AsmCvttsd2si.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.src)
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.dst)
        break
        -> AST_AsmCvtsi2sd_t {
            free_AssemblyType(@(self[])[].get._AsmCvtsi2sd.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.src)
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.dst)
        break
        -> AST_AsmUnary_t {
            free_AssemblyType(@(self[])[].get._AsmUnary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmUnary.dst)
        break
        -> AST_AsmBinary_t {
            free_AssemblyType(@(self[])[].get._AsmBinary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmBinary.src)
        free_AsmOperand(@(self[])[].get._AsmBinary.dst)
        break
        -> AST_AsmCmp_t {
            free_AssemblyType(@(self[])[].get._AsmCmp.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCmp.src)
        free_AsmOperand(@(self[])[].get._AsmCmp.dst)
        break
        -> AST_AsmIdiv_t {
            free_AssemblyType(@(self[])[].get._AsmIdiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmIdiv.src)
        break
        -> AST_AsmDiv_t {
            free_AssemblyType(@(self[])[].get._AsmDiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmDiv.src)
        break
        -> AST_AsmCdq_t {
            free_AssemblyType(@(self[])[].get._AsmCdq.asm_type)
        }
        break
        -> AST_AsmJmp_t {
            break
        }
        -> AST_AsmJmpCC_t {
            break
        }
        -> AST_AsmSetCC_t {
            free_AsmOperand(@(self[])[].get._AsmSetCC.dst)
        }
        break
        -> AST_AsmLabel_t {
            break
        }
        -> AST_AsmPush_t {
            free_AsmOperand(@(self[])[].get._AsmPush.src)
        }
        break
        -> AST_AsmPop_t {
            break
        }
        -> AST_AsmCall_t {
            break
        }
        -> AST_AsmRet_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_AsmTopLevel(none) *struc AsmTopLevel {
    self: unique_ptr_t(AsmTopLevel) = uptr_new()
    uptr_alloc(AsmTopLevel, self)
    self[].tag = AST_AsmTopLevel_t
    return self
}

pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: *vector_t(unique_ptr_t(AsmInstruction))) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmFunction_t
    self[].get._AsmFunction.name = name
    self[].get._AsmFunction.is_glob = is_glob
    self[].get._AsmFunction.is_ret_memory = is_ret_memory
    self[].get._AsmFunction.instructions = vec_new()
    vec_move(instructions[], self[].get._AsmFunction.instructions)
    return self
}

pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: *vector_t(shared_ptr_t(StaticInit))) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticVariable_t
    self[].get._AsmStaticVariable.name = name
    self[].get._AsmStaticVariable.alignment = alignment
    self[].get._AsmStaticVariable.is_glob = is_glob
    self[].get._AsmStaticVariable.static_inits = vec_new()
    vec_move(static_inits[], self[].get._AsmStaticVariable.static_inits)
    return self
}

pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticConstant_t
    self[].get._AsmStaticConstant.name = name
    self[].get._AsmStaticConstant.alignment = alignment
    self[].get._AsmStaticConstant.static_init = sptr_new()
    sptr_move(StaticInit, static_init[], self[].get._AsmStaticConstant.static_init)
    return self
}

pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_AsmTopLevel_t {
            break
        }
        -> AST_AsmFunction_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._AsmFunction.instructions) .. ++i {
                free_AsmInstruction(@(self[])[].get._AsmFunction.instructions[i])
            }
        }
        vec_delete(self[][].get._AsmFunction.instructions)
        break
        -> AST_AsmStaticVariable_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._AsmStaticVariable.static_inits) .. ++i {
                free_StaticInit(@(self[])[].get._AsmStaticVariable.static_inits[i])
            }
        }
        vec_delete(self[][].get._AsmStaticVariable.static_inits)
        break
        -> AST_AsmStaticConstant_t {
            free_StaticInit(@(self[])[].get._AsmStaticConstant.static_init)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_AsmProgram(static_const_toplvls: *vector_t(unique_ptr_t(AsmTopLevel)), top_levels: *vector_t(unique_ptr_t(AsmTopLevel))) *struc AsmProgram {
    self: unique_ptr_t(AsmProgram) = uptr_new()
    uptr_alloc(AsmProgram, self)
    self[].tag = AST_AsmProgram_t
    self[].static_const_toplvls = vec_new()
    vec_move(static_const_toplvls[], self[].static_const_toplvls)
    self[].top_levels = vec_new()
    vec_move(top_levels[], self[].top_levels)
    return self
}

pub fn free_AsmProgram(self: **struc AsmProgram) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_AsmProgram_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    loop i: u64 = 0 while i < vec_size(self[][].static_const_toplvls) .. ++i {
        free_AsmTopLevel(@(self[])[].static_const_toplvls[i])
    }
    vec_delete(self[][].static_const_toplvls)
    loop i: u64 = 0 while i < vec_size(self[][].top_levels) .. ++i {
        free_AsmTopLevel(@(self[])[].top_levels[i])
    }
    vec_delete(self[][].top_levels)
    uptr_free(self[])
}
