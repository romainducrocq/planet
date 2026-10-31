m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

pub fn make_CUnaryOp(tagged_def_impl(AST_T)) struc CUnaryOp {
    self: struc CUnaryOp = $(tag)
    match tag {
        -> AST_CUnaryOp_t {
            -> AST_CComplement_t {
                -> AST_CNegate_t {
                    -> AST_CNot_t {
                        -> AST_CPrefix_t {
                            -> AST_CPostfix_t {
                                return self
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

pub fn make_CBinaryOp(tagged_def_impl(AST_T)) struc CBinaryOp {
    self: struc CBinaryOp = $(tag)
    match tag {
        -> AST_CBinaryOp_t {
            -> AST_CAdd_t {
                -> AST_CSubtract_t {
                    -> AST_CMultiply_t {
                        -> AST_CDivide_t {
                            -> AST_CRemainder_t {
                                -> AST_CBitAnd_t {
                                    -> AST_CBitOr_t {
                                        -> AST_CBitXor_t {
                                            -> AST_CBitShiftLeft_t {
                                                -> AST_CBitShiftRight_t {
                                                    -> AST_CBitShrArithmetic_t {
                                                        -> AST_CAnd_t {
                                                            -> AST_COr_t {
                                                                -> AST_CEqual_t {
                                                                    -> AST_CNotEqual_t {
                                                                        -> AST_CLessThan_t {
                                                                            -> AST_CLessOrEqual_t {
                                                                                -> AST_CGreaterThan_t {
                                                                                    -> AST_CGreaterOrEqual_t {
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
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator {
    self: unique_ptr_t(CAbstractDeclarator) = uptr_new()
    uptr_alloc(CAbstractDeclarator, self)
    self[].tag = AST_CAbstractDeclarator_t
    return self
}

pub fn make_CAbstractPointer(abstract_decltor: *unique_ptr_t(CAbstractDeclarator)) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractPointer_t
    self[].get._CAbstractPointer.abstract_decltor = uptr_new()
    uptr_move(CAbstractDeclarator, abstract_decltor[], self[].get._CAbstractPointer.abstract_decltor)
    return self
}

pub fn make_CAbstractArray(size: i64, abstract_decltor: *unique_ptr_t(CAbstractDeclarator)) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractArray_t
    self[].get._CAbstractArray.size = size
    self[].get._CAbstractArray.abstract_decltor = uptr_new()
    uptr_move(CAbstractDeclarator, abstract_decltor[], self[].get._CAbstractArray.abstract_decltor)
    return self
}

pub fn make_CAbstractBase(none) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractBase_t
    return self
}

pub fn free_CAbstractDeclarator(self: *unique_ptr_t(CAbstractDeclarator)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CAbstractDeclarator_t {
            break
        }
        -> AST_CAbstractPointer_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractPointer.abstract_decltor)
        }
        break
        -> AST_CAbstractArray_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractArray.abstract_decltor)
        }
        break
        -> AST_CAbstractBase_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CParam(decltor: *unique_ptr_t(CDeclarator), param_type: **struc Type) *struc CParam {
    self: unique_ptr_t(CParam) = uptr_new()
    uptr_alloc(CParam, self)
    self[].tag = AST_CParam_t
    self[].decltor = uptr_new()
    uptr_move(CDeclarator, decltor[], self[].decltor)
    self[].param_type = sptr_new()
    sptr_move(Type, param_type[], self[].param_type)
    return self
}

pub fn free_CParam(self: *unique_ptr_t(CParam)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CParam_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    free_CDeclarator(@(self[])[].decltor)
    free_Type(@(self[])[].param_type)
    uptr_free(self[])
}

pub fn make_CDeclarator(none) *struc CDeclarator {
    self: unique_ptr_t(CDeclarator) = uptr_new()
    uptr_alloc(CDeclarator, self)
    self[].tag = AST_CDeclarator_t
    return self
}

pub fn make_CIdent(name: u64) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CIdent_t
    self[].get._CIdent.name = name
    return self
}

pub fn make_CPointerDeclarator(decltor: *unique_ptr_t(CDeclarator)) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CPointerDeclarator_t
    self[].get._CPointerDeclarator.decltor = uptr_new()
    uptr_move(CDeclarator, decltor[], self[].get._CPointerDeclarator.decltor)
    return self
}

pub fn make_CArrayDeclarator(size: i64, decltor: *unique_ptr_t(CDeclarator)) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CArrayDeclarator_t
    self[].get._CArrayDeclarator.size = size
    self[].get._CArrayDeclarator.decltor = uptr_new()
    uptr_move(CDeclarator, decltor[], self[].get._CArrayDeclarator.decltor)
    return self
}

pub fn make_CFunDeclarator(param_list: *vector_t(unique_ptr_t(CParam)), decltor: *unique_ptr_t(CDeclarator)) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CFunDeclarator_t
    self[].get._CFunDeclarator.param_list = vec_new()
    vec_move(param_list[], self[].get._CFunDeclarator.param_list)
    self[].get._CFunDeclarator.decltor = uptr_new()
    uptr_move(CDeclarator, decltor[], self[].get._CFunDeclarator.decltor)
    return self
}

pub fn free_CDeclarator(self: *unique_ptr_t(CDeclarator)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CDeclarator_t {
            break
        }
        -> AST_CIdent_t {
            break
        }
        -> AST_CPointerDeclarator_t {
            free_CDeclarator(@(self[])[].get._CPointerDeclarator.decltor)
        }
        break
        -> AST_CArrayDeclarator_t {
            free_CDeclarator(@(self[])[].get._CArrayDeclarator.decltor)
        }
        break
        -> AST_CFunDeclarator_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._CFunDeclarator.param_list) .. ++i {
                free_CParam(@(self[])[].get._CFunDeclarator.param_list[i])
            }
        }
        vec_delete(self[][].get._CFunDeclarator.param_list)
        free_CDeclarator(@(self[])[].get._CFunDeclarator.decltor)
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CExp(info_at: u64) *struc CExp {
    self: unique_ptr_t(CExp) = uptr_new()
    uptr_alloc(CExp, self)
    self[].tag = AST_CExp_t
    self[].exp_type = sptr_new()
    self[].info_at = info_at
    return self
}

pub fn make_CConstant(constant: **struc CConst, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConstant_t
    self[].get._CConstant.constant = sptr_new()
    sptr_move(CConst, constant[], self[].get._CConstant.constant)
    self[].get._CConstant._base = self
    return self
}

pub fn make_CString(literal: **struc CStringLiteral, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CString_t
    self[].get._CString.literal = sptr_new()
    sptr_move(CStringLiteral, literal[], self[].get._CString.literal)
    self[].get._CString._base = self
    return self
}

pub fn make_CVar(name: u64, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CVar_t
    self[].get._CVar.name = name
    self[].get._CVar._base = self
    return self
}

pub fn make_CCast(exp: *unique_ptr_t(CExp), target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CCast_t
    self[].get._CCast.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CCast.exp)
    self[].get._CCast.target_type = sptr_new()
    sptr_move(Type, target_type[], self[].get._CCast.target_type)
    self[].get._CCast._base = self
    return self
}

pub fn make_CUnary(unop: *struc CUnaryOp, exp: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CUnary_t
    self[].get._CUnary.unop = unop[]
    self[].get._CUnary.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CUnary.exp)
    self[].get._CUnary._base = self
    return self
}

pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CBinary_t
    self[].get._CBinary.binop = binop[]
    self[].get._CBinary.exp_left = uptr_new()
    uptr_move(CExp, exp_left[], self[].get._CBinary.exp_left)
    self[].get._CBinary.exp_right = uptr_new()
    uptr_move(CExp, exp_right[], self[].get._CBinary.exp_right)
    self[].get._CBinary._base = self
    return self
}

pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAssignment_t
    self[].get._CAssignment.unop = unop[]
    self[].get._CAssignment.exp_left = uptr_new()
    uptr_move(CExp, exp_left[], self[].get._CAssignment.exp_left)
    self[].get._CAssignment.exp_right = uptr_new()
    uptr_move(CExp, exp_right[], self[].get._CAssignment.exp_right)
    self[].get._CAssignment._base = self
    return self
}

pub fn make_CConditional(condition: *unique_ptr_t(CExp), exp_middle: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConditional_t
    self[].get._CConditional.condition = uptr_new()
    uptr_move(CExp, condition[], self[].get._CConditional.condition)
    self[].get._CConditional.exp_middle = uptr_new()
    uptr_move(CExp, exp_middle[], self[].get._CConditional.exp_middle)
    self[].get._CConditional.exp_right = uptr_new()
    uptr_move(CExp, exp_right[], self[].get._CConditional.exp_right)
    self[].get._CConditional._base = self
    return self
}

pub fn make_CFunctionCall(name: u64, args: *vector_t(unique_ptr_t(CExp)), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CFunctionCall_t
    self[].get._CFunctionCall.name = name
    self[].get._CFunctionCall.args = vec_new()
    vec_move(args[], self[].get._CFunctionCall.args)
    self[].get._CFunctionCall._base = self
    return self
}

pub fn make_CDereference(exp: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDereference_t
    self[].get._CDereference.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CDereference.exp)
    self[].get._CDereference._base = self
    return self
}

pub fn make_CAddrOf(exp: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAddrOf_t
    self[].get._CAddrOf.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CAddrOf.exp)
    self[].get._CAddrOf._base = self
    return self
}

pub fn make_CSubscript(primary_exp: *unique_ptr_t(CExp), subscript_exp: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSubscript_t
    self[].get._CSubscript.primary_exp = uptr_new()
    uptr_move(CExp, primary_exp[], self[].get._CSubscript.primary_exp)
    self[].get._CSubscript.subscript_exp = uptr_new()
    uptr_move(CExp, subscript_exp[], self[].get._CSubscript.subscript_exp)
    self[].get._CSubscript._base = self
    return self
}

pub fn make_CSizeOf(exp: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOf_t
    self[].get._CSizeOf.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CSizeOf.exp)
    self[].get._CSizeOf._base = self
    return self
}

pub fn make_CSizeOfT(target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOfT_t
    self[].get._CSizeOfT.target_type = sptr_new()
    sptr_move(Type, target_type[], self[].get._CSizeOfT.target_type)
    self[].get._CSizeOfT._base = self
    return self
}

pub fn make_CDot(member: u64, structure: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDot_t
    self[].get._CDot.member = member
    self[].get._CDot.structure = uptr_new()
    uptr_move(CExp, structure[], self[].get._CDot.structure)
    self[].get._CDot._base = self
    return self
}

pub fn make_CArrow(member: u64, pointer: *unique_ptr_t(CExp), info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CArrow_t
    self[].get._CArrow.member = member
    self[].get._CArrow.pointer = uptr_new()
    uptr_move(CExp, pointer[], self[].get._CArrow.pointer)
    self[].get._CArrow._base = self
    return self
}

pub fn free_CExp(self: *unique_ptr_t(CExp)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CExp_t {
            break
        }
        -> AST_CConstant_t {
            free_CConst(@(self[])[].get._CConstant.constant)
        }
        break
        -> AST_CString_t {
            free_CStringLiteral(@(self[])[].get._CString.literal)
        }
        break
        -> AST_CVar_t {
            break
        }
        -> AST_CCast_t {
            free_CExp(@(self[])[].get._CCast.exp)
        }
        free_Type(@(self[])[].get._CCast.target_type)
        break
        -> AST_CUnary_t {
            free_CExp(@(self[])[].get._CUnary.exp)
        }
        break
        -> AST_CBinary_t {
            free_CExp(@(self[])[].get._CBinary.exp_left)
        }
        free_CExp(@(self[])[].get._CBinary.exp_right)
        break
        -> AST_CAssignment_t {
            free_CExp(@(self[])[].get._CAssignment.exp_left)
        }
        free_CExp(@(self[])[].get._CAssignment.exp_right)
        break
        -> AST_CConditional_t {
            free_CExp(@(self[])[].get._CConditional.condition)
        }
        free_CExp(@(self[])[].get._CConditional.exp_middle)
        free_CExp(@(self[])[].get._CConditional.exp_right)
        break
        -> AST_CFunctionCall_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._CFunctionCall.args) .. ++i {
                free_CExp(@(self[])[].get._CFunctionCall.args[i])
            }
        }
        vec_delete(self[][].get._CFunctionCall.args)
        break
        -> AST_CDereference_t {
            free_CExp(@(self[])[].get._CDereference.exp)
        }
        break
        -> AST_CAddrOf_t {
            free_CExp(@(self[])[].get._CAddrOf.exp)
        }
        break
        -> AST_CSubscript_t {
            free_CExp(@(self[])[].get._CSubscript.primary_exp)
        }
        free_CExp(@(self[])[].get._CSubscript.subscript_exp)
        break
        -> AST_CSizeOf_t {
            free_CExp(@(self[])[].get._CSizeOf.exp)
        }
        break
        -> AST_CSizeOfT_t {
            free_Type(@(self[])[].get._CSizeOfT.target_type)
        }
        break
        -> AST_CDot_t {
            free_CExp(@(self[])[].get._CDot.structure)
        }
        break
        -> AST_CArrow_t {
            free_CExp(@(self[])[].get._CArrow.pointer)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    free_Type(@(self[])[].exp_type)
    uptr_free(self[])
}

pub fn make_CStatement(none) *struc CStatement {
    self: unique_ptr_t(CStatement) = uptr_new()
    uptr_alloc(CStatement, self)
    self[].tag = AST_CStatement_t
    return self
}

pub fn make_CReturn(exp: *unique_ptr_t(CExp), info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CReturn_t
    self[].get._CReturn.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CReturn.exp)
    self[].get._CReturn.info_at = info_at
    return self
}

pub fn make_CExpression(exp: *unique_ptr_t(CExp)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CExpression_t
    self[].get._CExpression.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CExpression.exp)
    return self
}

pub fn make_CIf(condition: *unique_ptr_t(CExp), then_fi: *unique_ptr_t(CStatement), else_fi: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CIf_t
    self[].get._CIf.condition = uptr_new()
    uptr_move(CExp, condition[], self[].get._CIf.condition)
    self[].get._CIf.then_fi = uptr_new()
    uptr_move(CStatement, then_fi[], self[].get._CIf.then_fi)
    self[].get._CIf.else_fi = uptr_new()
    uptr_move(CStatement, else_fi[], self[].get._CIf.else_fi)
    return self
}

pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CGoto_t
    self[].get._CGoto.target = target
    self[].get._CGoto.info_at = info_at
    return self
}

pub fn make_CLabel(target: u64, jump_to: *unique_ptr_t(CStatement), info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CLabel_t
    self[].get._CLabel.target = target
    self[].get._CLabel.jump_to = uptr_new()
    uptr_move(CStatement, jump_to[], self[].get._CLabel.jump_to)
    self[].get._CLabel.info_at = info_at
    return self
}

pub fn make_CCompound(block: *unique_ptr_t(CBlock)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCompound_t
    self[].get._CCompound.block = uptr_new()
    uptr_move(CBlock, block[], self[].get._CCompound.block)
    return self
}

pub fn make_CWhile(condition: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CWhile_t
    self[].get._CWhile.target = 0
    self[].get._CWhile.condition = uptr_new()
    uptr_move(CExp, condition[], self[].get._CWhile.condition)
    self[].get._CWhile.body = uptr_new()
    uptr_move(CStatement, body[], self[].get._CWhile.body)
    return self
}

pub fn make_CDoWhile(condition: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDoWhile_t
    self[].get._CDoWhile.target = 0
    self[].get._CDoWhile.condition = uptr_new()
    uptr_move(CExp, condition[], self[].get._CDoWhile.condition)
    self[].get._CDoWhile.body = uptr_new()
    uptr_move(CStatement, body[], self[].get._CDoWhile.body)
    return self
}

pub fn make_CFor(init: *unique_ptr_t(CForInit), condition: *unique_ptr_t(CExp), post: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CFor_t
    self[].get._CFor.target = 0
    self[].get._CFor.init = uptr_new()
    uptr_move(CForInit, init[], self[].get._CFor.init)
    self[].get._CFor.condition = uptr_new()
    uptr_move(CExp, condition[], self[].get._CFor.condition)
    self[].get._CFor.post = uptr_new()
    uptr_move(CExp, post[], self[].get._CFor.post)
    self[].get._CFor.body = uptr_new()
    uptr_move(CStatement, body[], self[].get._CFor.body)
    return self
}

pub fn make_CSwitch(lookup: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CSwitch_t
    self[].get._CSwitch.target = 0
    self[].get._CSwitch.is_default = false
    self[].get._CSwitch.lookup = uptr_new()
    uptr_move(CExp, lookup[], self[].get._CSwitch.lookup)
    self[].get._CSwitch.body = uptr_new()
    uptr_move(CStatement, body[], self[].get._CSwitch.body)
    self[].get._CSwitch.cases = vec_new()
    return self
}

pub fn make_CCase(value: *unique_ptr_t(CExp), jump_to: *unique_ptr_t(CStatement)) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCase_t
    self[].get._CCase.target = 0
    self[].get._CCase.value = uptr_new()
    uptr_move(CExp, value[], self[].get._CCase.value)
    self[].get._CCase.jump_to = uptr_new()
    uptr_move(CStatement, jump_to[], self[].get._CCase.jump_to)
    return self
}

pub fn make_CDefault(jump_to: *unique_ptr_t(CStatement), info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDefault_t
    self[].get._CDefault.target = 0
    self[].get._CDefault.jump_to = uptr_new()
    uptr_move(CStatement, jump_to[], self[].get._CDefault.jump_to)
    self[].get._CDefault.info_at = info_at
    return self
}

pub fn make_CBreak(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CBreak_t
    self[].get._CBreak.target = 0
    self[].get._CBreak.info_at = info_at
    return self
}

pub fn make_CContinue(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CContinue_t
    self[].get._CContinue.target = 0
    self[].get._CContinue.info_at = info_at
    return self
}

pub fn make_CNull(none) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CNull_t
    return self
}

pub fn free_CStatement(self: *unique_ptr_t(CStatement)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CStatement_t {
            break
        }
        -> AST_CReturn_t {
            free_CExp(@(self[])[].get._CReturn.exp)
        }
        break
        -> AST_CExpression_t {
            free_CExp(@(self[])[].get._CExpression.exp)
        }
        break
        -> AST_CIf_t {
            free_CExp(@(self[])[].get._CIf.condition)
        }
        free_CStatement(@(self[])[].get._CIf.then_fi)
        free_CStatement(@(self[])[].get._CIf.else_fi)
        break
        -> AST_CGoto_t {
            break
        }
        -> AST_CLabel_t {
            free_CStatement(@(self[])[].get._CLabel.jump_to)
        }
        break
        -> AST_CCompound_t {
            free_CBlock(@(self[])[].get._CCompound.block)
        }
        break
        -> AST_CWhile_t {
            free_CExp(@(self[])[].get._CWhile.condition)
        }
        free_CStatement(@(self[])[].get._CWhile.body)
        break
        -> AST_CDoWhile_t {
            free_CExp(@(self[])[].get._CDoWhile.condition)
        }
        free_CStatement(@(self[])[].get._CDoWhile.body)
        break
        -> AST_CFor_t {
            free_CForInit(@(self[])[].get._CFor.init)
        }
        free_CExp(@(self[])[].get._CFor.condition)
        free_CExp(@(self[])[].get._CFor.post)
        free_CStatement(@(self[])[].get._CFor.body)
        break
        -> AST_CSwitch_t {
            free_CExp(@(self[])[].get._CSwitch.lookup)
        }
        free_CStatement(@(self[])[].get._CSwitch.body)
        loop i: u64 = 0 while i < vec_size(self[][].get._CSwitch.cases) .. ++i {
            free_CExp(@(self[])[].get._CSwitch.cases[i])
        }
        vec_delete(self[][].get._CSwitch.cases)
        break
        -> AST_CCase_t {
            free_CExp(@(self[])[].get._CCase.value)
        }
        free_CStatement(@(self[])[].get._CCase.jump_to)
        break
        -> AST_CDefault_t {
            free_CStatement(@(self[])[].get._CDefault.jump_to)
        }
        break
        -> AST_CBreak_t {
            break
        }
        -> AST_CContinue_t {
            break
        }
        -> AST_CNull_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CForInit(none) *struc CForInit {
    self: unique_ptr_t(CForInit) = uptr_new()
    uptr_alloc(CForInit, self)
    self[].tag = AST_CForInit_t
    return self
}

pub fn make_CInitDecl(init: *unique_ptr_t(CVariableDeclaration)) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitDecl_t
    self[].get._CInitDecl.init = uptr_new()
    uptr_move(CVariableDeclaration, init[], self[].get._CInitDecl.init)
    return self
}

pub fn make_CInitExp(init: *unique_ptr_t(CExp)) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitExp_t
    self[].get._CInitExp.init = uptr_new()
    uptr_move(CExp, init[], self[].get._CInitExp.init)
    return self
}

pub fn free_CForInit(self: *unique_ptr_t(CForInit)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CForInit_t {
            break
        }
        -> AST_CInitDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CInitDecl.init)
        }
        break
        -> AST_CInitExp_t {
            free_CExp(@(self[])[].get._CInitExp.init)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CBlock(none) *struc CBlock {
    self: unique_ptr_t(CBlock) = uptr_new()
    uptr_alloc(CBlock, self)
    self[].tag = AST_CBlock_t
    return self
}

pub fn make_CB(block_items: *vector_t(unique_ptr_t(CBlockItem))) *struc CBlock {
    self: *struc CBlock = make_CBlock()
    self[].tag = AST_CB_t
    self[].get._CB.block_items = vec_new()
    vec_move(block_items[], self[].get._CB.block_items)
    return self
}

pub fn free_CBlock(self: *unique_ptr_t(CBlock)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CBlock_t {
            break
        }
        -> AST_CB_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._CB.block_items) .. ++i {
                free_CBlockItem(@(self[])[].get._CB.block_items[i])
            }
        }
        vec_delete(self[][].get._CB.block_items)
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CBlockItem(none) *struc CBlockItem {
    self: unique_ptr_t(CBlockItem) = uptr_new()
    uptr_alloc(CBlockItem, self)
    self[].tag = AST_CBlockItem_t
    return self
}

pub fn make_CS(statement: *unique_ptr_t(CStatement)) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CS_t
    self[].get._CS.statement = uptr_new()
    uptr_move(CStatement, statement[], self[].get._CS.statement)
    return self
}

pub fn make_CD(declaration: *unique_ptr_t(CDeclaration)) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CD_t
    self[].get._CD.declaration = uptr_new()
    uptr_move(CDeclaration, declaration[], self[].get._CD.declaration)
    return self
}

pub fn free_CBlockItem(self: **struc CBlockItem) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CBlockItem_t {
            break
        }
        -> AST_CS_t {
            free_CStatement(@(self[])[].get._CS.statement)
        }
        break
        -> AST_CD_t {
            free_CDeclaration(@(self[])[].get._CD.declaration)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CStorageClass(tagged_def_impl(AST_T)) struc CStorageClass {
    self: struc CStorageClass = $(tag)
    match tag {
        -> AST_CStorageClass_t {
            -> AST_CStatic_t {
                -> AST_CExtern_t {
                    return self
                }
            }
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn make_CInitializer(none) *struc CInitializer {
    self: unique_ptr_t(CInitializer) = uptr_new()
    uptr_alloc(CInitializer, self)
    self[].tag = AST_CInitializer_t
    self[].init_type = sptr_new()
    return self
}

pub fn make_CSingleInit(exp: *unique_ptr_t(CExp)) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CSingleInit_t
    self[].get._CSingleInit.exp = uptr_new()
    uptr_move(CExp, exp[], self[].get._CSingleInit.exp)
    self[].get._CSingleInit._base = self
    return self
}

pub fn make_CCompoundInit(initializers: *vector_t(unique_ptr_t(CInitializer))) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CCompoundInit_t
    self[].get._CCompoundInit.initializers = vec_new()
    vec_move(initializers[], self[].get._CCompoundInit.initializers)
    self[].get._CCompoundInit._base = self
    return self
}

pub fn free_CInitializer(self: *unique_ptr_t(CInitializer)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CInitializer_t {
            break
        }
        -> AST_CSingleInit_t {
            free_CExp(@(self[])[].get._CSingleInit.exp)
        }
        break
        -> AST_CCompoundInit_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._CCompoundInit.initializers) .. ++i {
                free_CInitializer(@(self[])[].get._CCompoundInit.initializers[i])
            }
        }
        vec_delete(self[][].get._CCompoundInit.initializers)
        break
        otherwise {
            THROW_ABORT
        }
    }
    free_Type(@(self[])[].init_type)
    uptr_free(self[])
}

pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration {
    self: unique_ptr_t(CMemberDeclaration) = uptr_new()
    uptr_alloc(CMemberDeclaration, self)
    self[].tag = AST_CMemberDeclaration_t
    self[].member_name = member_name
    self[].member_type = sptr_new()
    sptr_move(Type, member_type[], self[].member_type)
    self[].info_at = info_at
    return self
}

pub fn free_CMemberDeclaration(self: *unique_ptr_t(CMemberDeclaration)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CMemberDeclaration_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    free_Type(@(self[])[].member_type)
    uptr_free(self[])
}

pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: *vector_t(unique_ptr_t(CMemberDeclaration)), info_at: u64) *struc CStructDeclaration {
    self: unique_ptr_t(CStructDeclaration) = uptr_new()
    uptr_alloc(CStructDeclaration, self)
    self[].tag = AST_CStructDeclaration_t
    self[].tag_name = tag_name
    self[].is_union = is_union
    self[].members = vec_new()
    vec_move(members[], self[].members)
    self[].info_at = info_at
    return self
}

pub fn free_CStructDeclaration(self: *unique_ptr_t(CStructDeclaration)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CStructDeclaration_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    loop i: u64 = 0 while i < vec_size(self[][].members) .. ++i {
        free_CMemberDeclaration(@(self[])[].members[i])
    }
    vec_delete(self[][].members)
    uptr_free(self[])
}

pub fn make_CFunctionDeclaration(name: u64, params: *vector_t(TIdentifier), body: *unique_ptr_t(CBlock), fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration {
    self: unique_ptr_t(CFunctionDeclaration) = uptr_new()
    uptr_alloc(CFunctionDeclaration, self)
    self[].tag = AST_CFunctionDeclaration_t
    self[].name = name
    self[].params = vec_new()
    vec_move(params[], self[].params)
    self[].body = uptr_new()
    uptr_move(CBlock, body[], self[].body)
    self[].fun_type = sptr_new()
    sptr_move(Type, fun_type[], self[].fun_type)
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CFunctionDeclaration(self: *unique_ptr_t(CFunctionDeclaration)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CFunctionDeclaration_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    vec_delete(self[][].params)
    free_CBlock(@(self[])[].body)
    free_Type(@(self[])[].fun_type)
    uptr_free(self[])
}

pub fn make_CVariableDeclaration(name: u64, init: *unique_ptr_t(CInitializer), var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration {
    self: unique_ptr_t(CVariableDeclaration) = uptr_new()
    uptr_alloc(CVariableDeclaration, self)
    self[].tag = AST_CVariableDeclaration_t
    self[].name = name
    self[].init = uptr_new()
    uptr_move(CInitializer, init[], self[].init)
    self[].var_type = sptr_new()
    sptr_move(Type, var_type[], self[].var_type)
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CVariableDeclaration(self: *unique_ptr_t(CVariableDeclaration)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CVariableDeclaration_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    free_CInitializer(@(self[])[].init)
    free_Type(@(self[])[].var_type)
    uptr_free(self[])
}

pub fn make_CDeclaration(none) *struc CDeclaration {
    self: unique_ptr_t(CDeclaration) = uptr_new()
    uptr_alloc(CDeclaration, self)
    self[].tag = AST_CDeclaration_t
    return self
}

pub fn make_CFunDecl(fun_decl: *unique_ptr_t(CFunctionDeclaration)) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CFunDecl_t
    self[].get._CFunDecl.fun_decl = uptr_new()
    uptr_move(CFunctionDeclaration, fun_decl[], self[].get._CFunDecl.fun_decl)
    return self
}

pub fn make_CVarDecl(var_decl: *unique_ptr_t(CVariableDeclaration)) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CVarDecl_t
    self[].get._CVarDecl.var_decl = uptr_new()
    uptr_move(CVariableDeclaration, var_decl[], self[].get._CVarDecl.var_decl)
    return self
}

pub fn make_CStructDecl(struct_decl: *unique_ptr_t(CStructDeclaration)) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CStructDecl_t
    self[].get._CStructDecl.struct_decl = uptr_new()
    uptr_move(CStructDeclaration, struct_decl[], self[].get._CStructDecl.struct_decl)
    return self
}

pub fn free_CDeclaration(self: *unique_ptr_t(CDeclaration)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CDeclaration_t {
            break
        }
        -> AST_CFunDecl_t {
            free_CFunctionDeclaration(@(self[])[].get._CFunDecl.fun_decl)
        }
        break
        -> AST_CVarDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CVarDecl.var_decl)
        }
        break
        -> AST_CStructDecl_t {
            free_CStructDeclaration(@(self[])[].get._CStructDecl.struct_decl)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    uptr_free(self[])
}

pub fn make_CProgram(declarations: *vector_t(unique_ptr_t(CDeclaration))) *struc CProgram {
    self: unique_ptr_t(CProgram) = uptr_new()
    uptr_alloc(CProgram, self)
    self[].tag = AST_CProgram_t
    self[].declarations = vec_new()
    vec_move(declarations[], self[].declarations)
    return self
}

pub fn free_CProgram(self: *unique_ptr_t(CProgram)) none {
    uptr_delete(self[])
    match (self[])[].tag {
        -> AST_CProgram_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    loop i: u64 = 0 while i < vec_size(self[][].declarations) .. ++i {
        free_CDeclaration(@(self[])[].declarations[i])
    }
    vec_delete(self[][].declarations)
    uptr_free(self[])
}
