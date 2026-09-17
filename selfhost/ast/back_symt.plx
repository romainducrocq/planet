m4_include(`ast.plx.m4')m4_dnl
m4_include(`back_ast.plx.m4')m4_dnl
m4_include(`back_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

pub fn make_AssemblyType(none) *struc AssemblyType {
    self: *struc AssemblyType = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(AssemblyType, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(AssemblyType, self)"
            free_AssemblyType(@self)
            self = cast<*struc AssemblyType>(malloc(sizeof<struc AssemblyType>))
            if not self {
                panic_sigabrt("alloc "                     "AssemblyType")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_AssemblyType_t
    return self
}

pub fn make_Byte(none) *struc AssemblyType {
    self: *struc AssemblyType = make_AssemblyType()
    self[].tag = AST_Byte_t
    return self
}

pub fn make_LongWord(none) *struc AssemblyType {
    self: *struc AssemblyType = make_AssemblyType()
    self[].tag = AST_LongWord_t
    return self
}

pub fn make_QuadWord(none) *struc AssemblyType {
    self: *struc AssemblyType = make_AssemblyType()
    self[].tag = AST_QuadWord_t
    return self
}

pub fn make_BackendDouble(none) *struc AssemblyType {
    self: *struc AssemblyType = make_AssemblyType()
    self[].tag = AST_BackendDouble_t
    return self
}

pub fn make_ByteArray(size: i64, alignment: i32) *struc AssemblyType {
    self: *struc AssemblyType = make_AssemblyType()
    self[].tag = AST_ByteArray_t
    self[].get._ByteArray.size = size
    self[].get._ByteArray.alignment = alignment
    return self
}

pub fn free_AssemblyType(self: **struc AssemblyType) none {
    loop .. while 0 {
        " #@MACRO@:sptr_delete(*self)"
        if not self[] {
            " #@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_AssemblyType_t {
            -> AST_Byte_t {
                -> AST_LongWord_t {
                    -> AST_QuadWord_t {
                        -> AST_BackendDouble_t {
                            -> AST_ByteArray_t {
                                break
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
    loop .. while 0 {
        " #@MACRO@:sptr_free(*self)"
        if self[] {
            " #@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_BackendSymbol(none) *struc BackendSymbol {
    self: *struc BackendSymbol = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(BackendSymbol, self)"
        free_BackendSymbol(@self)
        self = cast<*struc BackendSymbol>(malloc(sizeof<struc BackendSymbol>))
        if not self {
            panic_sigabrt("alloc "                 "BackendSymbol")
        }
    }
    self[].tag = AST_BackendSymbol_t
    return self
}

pub fn make_BackendObj(is_static: i32, is_const: i32, asm_type: **struc AssemblyType) *struc BackendSymbol {
    self: *struc BackendSymbol = make_BackendSymbol()
    self[].tag = AST_BackendObj_t
    self[].get._BackendObj.is_static = is_static
    self[].get._BackendObj.is_const = is_const
    self[].get._BackendObj.asm_type = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._BackendObj.asm_type)"
        if asm_type[] ~= self[].get._BackendObj.asm_type {
            " #@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._BackendObj.asm_type)"
            free_AssemblyType(@self[].get._BackendObj.asm_type)
            self[].get._BackendObj.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    return self
}

pub fn make_BackendFun(is_def: i32) *struc BackendSymbol {
    self: *struc BackendSymbol = make_BackendSymbol()
    self[].tag = AST_BackendFun_t
    self[].get._BackendFun.is_def = is_def
    self[].get._BackendFun.callee_saved_regs = vec_new()
    return self
}

pub fn free_BackendSymbol(self: **struc BackendSymbol) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_BackendSymbol_t {
            break
        }
        -> AST_BackendObj_t {
            free_AssemblyType(@(self[])[].get._BackendObj.asm_type)
        }
        break
        -> AST_BackendFun_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._BackendFun.callee_saved_regs) then (cast<*struc stbds_array_header>(((self[])[].get._BackendFun.callee_saved_regs)) - 1)[].length else 0) .. ++i {
                free_AsmOperand(@(self[])[].get._BackendFun.callee_saved_regs[i])
            }
        }
        vec_delete(self[][].get._BackendFun.callee_saved_regs)
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}
