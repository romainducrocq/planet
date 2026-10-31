m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl
m4_include(`interm_ast.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

pub fn make_TacUnaryOp(tagged_def_impl(AST_T)) struc TacUnaryOp {
    self: struc TacUnaryOp = $(tag)
    match tag {
        -> AST_TacUnaryOp_t {
            -> AST_TacComplement_t {
                -> AST_TacNegate_t {
                    -> AST_TacNot_t {
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

pub fn make_TacBinaryOp(tagged_def_impl(AST_T)) struc TacBinaryOp {
    self: struc TacBinaryOp = $(tag)
    match tag {
        -> AST_TacBinaryOp_t {
            -> AST_TacAdd_t {
                -> AST_TacSubtract_t {
                    -> AST_TacMultiply_t {
                        -> AST_TacDivide_t {
                            -> AST_TacRemainder_t {
                                -> AST_TacBitAnd_t {
                                    -> AST_TacBitOr_t {
                                        -> AST_TacBitXor_t {
                                            -> AST_TacBitShiftLeft_t {
                                                -> AST_TacBitShiftRight_t {
                                                    -> AST_TacBitShrArithmetic_t {
                                                        -> AST_TacEqual_t {
                                                            -> AST_TacNotEqual_t {
                                                                -> AST_TacLessThan_t {
                                                                    -> AST_TacLessOrEqual_t {
                                                                        -> AST_TacGreaterThan_t {
                                                                            -> AST_TacGreaterOrEqual_t {
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
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_TacValue(none) *struc TacValue {
    self: shared_ptr_t(TacValue) = sptr_new()
    sptr_alloc(TacValue, self)
    self[].tag = AST_TacValue_t
    return self
}

pub fn make_TacConstant(constant: *shared_ptr_t(CConst)) *struc TacValue {
    self: shared_ptr_t(TacValue) = make_TacValue()
    self[].tag = AST_TacConstant_t
    self[].get._TacConstant.constant = sptr_new()
    sptr_move(CConst, constant[], self[].get._TacConstant.constant)
    return self
}

pub fn make_TacVariable(name: u64) *struc TacValue {
    self: shared_ptr_t(TacValue) = make_TacValue()
    self[].tag = AST_TacVariable_t
    self[].get._TacVariable.name = name
    return self
}

pub fn free_TacValue(self: *shared_ptr_t(TacValue)) none {
    sptr_delete(self[])
    match (self[])[].tag {
        -> AST_TacValue_t {
            break
        }
        -> AST_TacConstant_t {
            free_CConst(@(self[])[].get._TacConstant.constant)
        }
        break
        -> AST_TacVariable_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    sptr_free(self[])
}

pub fn make_TacExpResult(none) *struc TacExpResult {
    self: unique_ptr_t(TacExpResult) = uptr_new()
    uptr_alloc(TacExpResult, self)
    self[].tag = AST_TacExpResult_t
    return self
}

pub fn make_TacPlainOperand(val: *shared_ptr_t(TacValue)) *struc TacExpResult {
    self: unique_ptr_t(TacExpResult) = make_TacExpResult()
    self[].tag = AST_TacPlainOperand_t
    self[].get._TacPlainOperand.val = sptr_new()
    sptr_move(TacValue, val[], self[].get._TacPlainOperand.val)
    return self
}

pub fn make_TacDereferencedPointer(val: *shared_ptr_t(TacValue)) *struc TacExpResult {
    self: unique_ptr_t(TacExpResult) = make_TacExpResult()
    self[].tag = AST_TacDereferencedPointer_t
    self[].get._TacDereferencedPointer.val = sptr_new()
    sptr_move(TacValue, val[], self[].get._TacDereferencedPointer.val)
    return self
}

pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult {
    self: unique_ptr_t(TacExpResult) = make_TacExpResult()
    self[].tag = AST_TacSubObject_t
    self[].get._TacSubObject.base_name = base_name
    self[].get._TacSubObject.offset = offset
    return self
}

pub fn free_TacExpResult(self: *unique_ptr_t(TacExpResult)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_TacExpResult_t {
            break
        }
        -> AST_TacPlainOperand_t {
            free_TacValue(@(self[])[].get._TacPlainOperand.val)
        }
        break
        -> AST_TacDereferencedPointer_t {
            free_TacValue(@(self[])[].get._TacDereferencedPointer.val)
        }
        break
        -> AST_TacSubObject_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_TacInstruction(none) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = uptr_new()
    uptr_alloc(TacInstruction, self)
    self[].tag = AST_TacInstruction_t
    return self
}

pub fn make_TacReturn(val: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacReturn_t
    self[].get._TacReturn.val = sptr_new()
    sptr_move(TacValue, val[], self[].get._TacReturn.val)
    return self
}

pub fn make_TacSignExtend(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacSignExtend_t
    self[].get._TacSignExtend.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacSignExtend.src)
    self[].get._TacSignExtend.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacSignExtend.dst)
    return self
}

pub fn make_TacTruncate(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacTruncate_t
    self[].get._TacTruncate.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacTruncate.src)
    self[].get._TacTruncate.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacTruncate.dst)
    return self
}

pub fn make_TacZeroExtend(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacZeroExtend_t
    self[].get._TacZeroExtend.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacZeroExtend.src)
    self[].get._TacZeroExtend.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacZeroExtend.dst)
    return self
}

pub fn make_TacDoubleToInt(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacDoubleToInt_t
    self[].get._TacDoubleToInt.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacDoubleToInt.src)
    self[].get._TacDoubleToInt.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacDoubleToInt.dst)
    return self
}

pub fn make_TacDoubleToUInt(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacDoubleToUInt_t
    self[].get._TacDoubleToUInt.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacDoubleToUInt.src)
    self[].get._TacDoubleToUInt.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacDoubleToUInt.dst)
    return self
}

pub fn make_TacIntToDouble(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacIntToDouble_t
    self[].get._TacIntToDouble.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacIntToDouble.src)
    self[].get._TacIntToDouble.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacIntToDouble.dst)
    return self
}

pub fn make_TacUIntToDouble(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacUIntToDouble_t
    self[].get._TacUIntToDouble.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacUIntToDouble.src)
    self[].get._TacUIntToDouble.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacUIntToDouble.dst)
    return self
}

pub fn make_TacFunCall(name: u64, args: *vector_t(shared_ptr_t(TacValue)), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacFunCall_t
    self[].get._TacFunCall.name = name
    self[].get._TacFunCall.args = vec_new()
    vec_move(args[], self[].get._TacFunCall.args)
    self[].get._TacFunCall.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacFunCall.dst)
    return self
}

pub fn make_TacUnary(unop: *struc TacUnaryOp, src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacUnary_t
    self[].get._TacUnary.unop = unop[]
    self[].get._TacUnary.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacUnary.src)
    self[].get._TacUnary.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacUnary.dst)
    return self
}

pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: *shared_ptr_t(TacValue), src2: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacBinary_t
    self[].get._TacBinary.binop = binop[]
    self[].get._TacBinary.src1 = sptr_new()
    sptr_move(TacValue, src1[], self[].get._TacBinary.src1)
    self[].get._TacBinary.src2 = sptr_new()
    sptr_move(TacValue, src2[], self[].get._TacBinary.src2)
    self[].get._TacBinary.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacBinary.dst)
    return self
}

pub fn make_TacCopy(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacCopy_t
    self[].get._TacCopy.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacCopy.src)
    self[].get._TacCopy.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacCopy.dst)
    return self
}

pub fn make_TacGetAddress(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacGetAddress_t
    self[].get._TacGetAddress.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacGetAddress.src)
    self[].get._TacGetAddress.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacGetAddress.dst)
    return self
}

pub fn make_TacLoad(src_ptr: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacLoad_t
    self[].get._TacLoad.src_ptr = sptr_new()
    sptr_move(TacValue, src_ptr[], self[].get._TacLoad.src_ptr)
    self[].get._TacLoad.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacLoad.dst)
    return self
}

pub fn make_TacStore(src: *shared_ptr_t(TacValue), dst_ptr: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacStore_t
    self[].get._TacStore.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacStore.src)
    self[].get._TacStore.dst_ptr = sptr_new()
    sptr_move(TacValue, dst_ptr[], self[].get._TacStore.dst_ptr)
    return self
}

pub fn make_TacAddPtr(scale: i64, src_ptr: *shared_ptr_t(TacValue), idx: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacAddPtr_t
    self[].get._TacAddPtr.scale = scale
    self[].get._TacAddPtr.src_ptr = sptr_new()
    sptr_move(TacValue, src_ptr[], self[].get._TacAddPtr.src_ptr)
    self[].get._TacAddPtr.idx = sptr_new()
    sptr_move(TacValue, idx[], self[].get._TacAddPtr.idx)
    self[].get._TacAddPtr.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacAddPtr.dst)
    return self
}

pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacCopyToOffset_t
    self[].get._TacCopyToOffset.dst_name = dst_name
    self[].get._TacCopyToOffset.offset = offset
    self[].get._TacCopyToOffset.src = sptr_new()
    sptr_move(TacValue, src[], self[].get._TacCopyToOffset.src)
    return self
}

pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacCopyFromOffset_t
    self[].get._TacCopyFromOffset.src_name = src_name
    self[].get._TacCopyFromOffset.offset = offset
    self[].get._TacCopyFromOffset.dst = sptr_new()
    sptr_move(TacValue, dst[], self[].get._TacCopyFromOffset.dst)
    return self
}

pub fn make_TacJump(target: u64) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacJump_t
    self[].get._TacJump.target = target
    return self
}

pub fn make_TacJumpIfZero(target: u64, condition: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacJumpIfZero_t
    self[].get._TacJumpIfZero.target = target
    self[].get._TacJumpIfZero.condition = sptr_new()
    sptr_move(TacValue, condition[], self[].get._TacJumpIfZero.condition)
    return self
}

pub fn make_TacJumpIfNotZero(target: u64, condition: *shared_ptr_t(TacValue)) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacJumpIfNotZero_t
    self[].get._TacJumpIfNotZero.target = target
    self[].get._TacJumpIfNotZero.condition = sptr_new()
    sptr_move(TacValue, condition[], self[].get._TacJumpIfNotZero.condition)
    return self
}

pub fn make_TacLabel(name: u64) *struc TacInstruction {
    self: unique_ptr_t(TacInstruction) = make_TacInstruction()
    self[].tag = AST_TacLabel_t
    self[].get._TacLabel.name = name
    return self
}

pub fn free_TacInstruction(self: *unique_ptr_t(TacInstruction)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_TacInstruction_t {
            break
        }
        -> AST_TacReturn_t {
            free_TacValue(@(self[])[].get._TacReturn.val)
        }
        break
        -> AST_TacSignExtend_t {
            free_TacValue(@(self[])[].get._TacSignExtend.src)
        }
        free_TacValue(@(self[])[].get._TacSignExtend.dst)
        break
        -> AST_TacTruncate_t {
            free_TacValue(@(self[])[].get._TacTruncate.src)
        }
        free_TacValue(@(self[])[].get._TacTruncate.dst)
        break
        -> AST_TacZeroExtend_t {
            free_TacValue(@(self[])[].get._TacZeroExtend.src)
        }
        free_TacValue(@(self[])[].get._TacZeroExtend.dst)
        break
        -> AST_TacDoubleToInt_t {
            free_TacValue(@(self[])[].get._TacDoubleToInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToInt.dst)
        break
        -> AST_TacDoubleToUInt_t {
            free_TacValue(@(self[])[].get._TacDoubleToUInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToUInt.dst)
        break
        -> AST_TacIntToDouble_t {
            free_TacValue(@(self[])[].get._TacIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacIntToDouble.dst)
        break
        -> AST_TacUIntToDouble_t {
            free_TacValue(@(self[])[].get._TacUIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacUIntToDouble.dst)
        break
        -> AST_TacFunCall_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._TacFunCall.args) .. ++i {
                free_TacValue(@(self[])[].get._TacFunCall.args[i])
            }
        }
        vec_delete(self[][].get._TacFunCall.args)
        free_TacValue(@(self[])[].get._TacFunCall.dst)
        break
        -> AST_TacUnary_t {
            free_TacValue(@(self[])[].get._TacUnary.src)
        }
        free_TacValue(@(self[])[].get._TacUnary.dst)
        break
        -> AST_TacBinary_t {
            free_TacValue(@(self[])[].get._TacBinary.src1)
        }
        free_TacValue(@(self[])[].get._TacBinary.src2)
        free_TacValue(@(self[])[].get._TacBinary.dst)
        break
        -> AST_TacCopy_t {
            free_TacValue(@(self[])[].get._TacCopy.src)
        }
        free_TacValue(@(self[])[].get._TacCopy.dst)
        break
        -> AST_TacGetAddress_t {
            free_TacValue(@(self[])[].get._TacGetAddress.src)
        }
        free_TacValue(@(self[])[].get._TacGetAddress.dst)
        break
        -> AST_TacLoad_t {
            free_TacValue(@(self[])[].get._TacLoad.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacLoad.dst)
        break
        -> AST_TacStore_t {
            free_TacValue(@(self[])[].get._TacStore.src)
        }
        free_TacValue(@(self[])[].get._TacStore.dst_ptr)
        break
        -> AST_TacAddPtr_t {
            free_TacValue(@(self[])[].get._TacAddPtr.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacAddPtr.idx)
        free_TacValue(@(self[])[].get._TacAddPtr.dst)
        break
        -> AST_TacCopyToOffset_t {
            free_TacValue(@(self[])[].get._TacCopyToOffset.src)
        }
        break
        -> AST_TacCopyFromOffset_t {
            free_TacValue(@(self[])[].get._TacCopyFromOffset.dst)
        }
        break
        -> AST_TacJump_t {
            break
        }
        -> AST_TacJumpIfZero_t {
            free_TacValue(@(self[])[].get._TacJumpIfZero.condition)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            free_TacValue(@(self[])[].get._TacJumpIfNotZero.condition)
        }
        break
        -> AST_TacLabel_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_TacTopLevel(none) *struc TacTopLevel {
    self: unique_ptr_t(TacTopLevel) = uptr_new()
    uptr_alloc(TacTopLevel, self)
    self[].tag = AST_TacTopLevel_t
    return self
}

pub fn make_TacFunction(name: u64, is_glob: i32, params: *vector_t(TIdentifier), body: *vector_t(unique_ptr_t(TacInstruction))) *struc TacTopLevel {
    self: unique_ptr_t(TacTopLevel) = make_TacTopLevel()
    self[].tag = AST_TacFunction_t
    self[].get._TacFunction.name = name
    self[].get._TacFunction.is_glob = is_glob
    self[].get._TacFunction.params = vec_new()
    vec_move(params[], self[].get._TacFunction.params)
    self[].get._TacFunction.body = vec_new()
    vec_move(body[], self[].get._TacFunction.body)
    return self
}

pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: *shared_ptr_t(Type), static_inits: *vector_t(shared_ptr_t(StaticInit))) *struc TacTopLevel {
    self: unique_ptr_t(TacTopLevel) = make_TacTopLevel()
    self[].tag = AST_TacStaticVariable_t
    self[].get._TacStaticVariable.name = name
    self[].get._TacStaticVariable.is_glob = is_glob
    self[].get._TacStaticVariable.static_init_type = sptr_new()
    sptr_move(Type, static_init_type[], self[].get._TacStaticVariable.static_init_type)
    self[].get._TacStaticVariable.static_inits = vec_new()
    vec_move(static_inits[], self[].get._TacStaticVariable.static_inits)
    return self
}

pub fn make_TacStaticConstant(name: u64, static_init_type: *shared_ptr_t(Type), static_init: *shared_ptr_t(StaticInit)) *struc TacTopLevel {
    self: unique_ptr_t(TacTopLevel) = make_TacTopLevel()
    self[].tag = AST_TacStaticConstant_t
    self[].get._TacStaticConstant.name = name
    self[].get._TacStaticConstant.static_init_type = sptr_new()
    sptr_move(Type, static_init_type[], self[].get._TacStaticConstant.static_init_type)
    self[].get._TacStaticConstant.static_init = sptr_new()
    sptr_move(StaticInit, static_init[], self[].get._TacStaticConstant.static_init)
    return self
}

pub fn free_TacTopLevel(self: *unique_ptr_t(TacTopLevel)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_TacTopLevel_t {
            break
        }
        -> AST_TacFunction_t {
            vec_delete(self[][].get._TacFunction.params)
        }
        loop i: u64 = 0 while i < vec_size(self[][].get._TacFunction.body) .. ++i {
            free_TacInstruction(@(self[])[].get._TacFunction.body[i])
        }
        vec_delete(self[][].get._TacFunction.body)
        break
        -> AST_TacStaticVariable_t {
            free_Type(@(self[])[].get._TacStaticVariable.static_init_type)
        }
        loop i: u64 = 0 while i < vec_size(self[][].get._TacStaticVariable.static_inits) .. ++i {
            free_StaticInit(@(self[])[].get._TacStaticVariable.static_inits[i])
        }
        vec_delete(self[][].get._TacStaticVariable.static_inits)
        break
        -> AST_TacStaticConstant_t {
            free_Type(@(self[])[].get._TacStaticConstant.static_init_type)
        }
        free_StaticInit(@(self[])[].get._TacStaticConstant.static_init)
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_TacProgram(static_const_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), static_var_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), fun_toplvls: *vector_t(unique_ptr_t(TacTopLevel))) *struc TacProgram {
    self: unique_ptr_t(TacProgram) = uptr_new()
    uptr_alloc(TacProgram, self)
    self[].tag = AST_TacProgram_t
    self[].static_const_toplvls = vec_new()
    vec_move(static_const_toplvls[], self[].static_const_toplvls)
    self[].static_var_toplvls = vec_new()
    vec_move(static_var_toplvls[], self[].static_var_toplvls)
    self[].fun_toplvls = vec_new()
    vec_move(fun_toplvls[], self[].fun_toplvls)
    return self
}

pub fn free_TacProgram(self: *unique_ptr_t(TacProgram)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_TacProgram_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    loop i: u64 = 0 while i < vec_size(self[][].static_const_toplvls) .. ++i {
        free_TacTopLevel(@(self[])[].static_const_toplvls[i])
    }
    vec_delete(self[][].static_const_toplvls)
    loop i: u64 = 0 while i < vec_size(self[][].static_var_toplvls) .. ++i {
        free_TacTopLevel(@(self[])[].static_var_toplvls[i])
    }
    vec_delete(self[][].static_var_toplvls)
    loop i: u64 = 0 while i < vec_size(self[][].fun_toplvls) .. ++i {
        free_TacTopLevel(@(self[])[].fun_toplvls[i])
    }
    vec_delete(self[][].fun_toplvls)
    uptr_free(self[])
}
