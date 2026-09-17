#ifndef _AST_BACK_SYMT_H
#define _AST_BACK_SYMT_H

#include "../lib/c_std.h"

#include "../ast/ast.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Backend symbol table

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct AssemblyType;
struct BackendSymbol;
struct AsmOperand;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// assembly_type = Byte
//               | LongWord
//               | QuadWord
//               | BackendDouble
//               | ByteArray(int, int)

struct Byte {
    char _empty;
};

struct LongWord {
    char _empty;
};

struct QuadWord {
    char _empty;
};

struct BackendDouble {
    char _empty;
};

struct ByteArray {
    TLong size;
    TInt alignment;
};

union _AssemblyType {
    struct Byte _Byte;
    struct LongWord _LongWord;
    struct QuadWord _QuadWord;
    struct BackendDouble _BackendDouble;
    struct ByteArray _ByteArray;
};

struct AssemblyType {
    shared_ptr_impl(AST_T);
    union _AssemblyType get;
};

shared_ptr_t(AssemblyType) make_AssemblyType(void);
shared_ptr_t(AssemblyType) make_Byte(void);
shared_ptr_t(AssemblyType) make_LongWord(void);
shared_ptr_t(AssemblyType) make_QuadWord(void);
shared_ptr_t(AssemblyType) make_BackendDouble(void);
shared_ptr_t(AssemblyType) make_ByteArray(TLong size, TInt alignment);
void free_AssemblyType(shared_ptr_t(AssemblyType) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// symbol = Obj(assembly_type, bool, bool)
//        | Fun(bool, operand*)

struct BackendObj {
    bool is_static;
    bool is_const;
    shared_ptr_t(AssemblyType) asm_type;
};

struct BackendFun {
    bool is_def;
    vector_t(shared_ptr_t(AsmOperand)) callee_saved_regs;
};

union _BackendSymbol {
    struct BackendObj _BackendObj;
    struct BackendFun _BackendFun;
};

struct BackendSymbol {
    unique_ptr_impl(AST_T);
    union _BackendSymbol get;
};

unique_ptr_t(BackendSymbol) make_BackendSymbol(void);
unique_ptr_t(BackendSymbol) make_BackendObj(bool is_static, bool is_const, shared_ptr_t(AssemblyType) * asm_type);
unique_ptr_t(BackendSymbol) make_BackendFun(bool is_def);
void free_BackendSymbol(unique_ptr_t(BackendSymbol) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define UPtrBackendSymbol unique_ptr_t(BackendSymbol)
PairKeyValue(TIdentifier, UPtrBackendSymbol);

struct BackEndContext {
    hashmap_t(TIdentifier, UPtrBackendSymbol) symbol_table;
};

#endif
