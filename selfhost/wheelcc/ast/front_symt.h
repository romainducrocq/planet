#ifndef _AST_FRONT_SYMT_H
#define _AST_FRONT_SYMT_H

#include "../lib/c_std.h"

#include "../ast/ast.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Frontend symbol table

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct Type;
struct StaticInit;
struct InitialValue;
struct IdentifierAttr;
struct Symbol;
struct StructMember;
struct StructTypedef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// type = Char
//      | SChar
//      | UChar
//      | Int
//      | Long
//      | UInt
//      | ULong
//      | Double
//      | Void
//      | FunType(int, int, type*, type)
//      | Pointer(type)
//      | Array(int, type)
//      | Structure(identifier, bool)

struct Char {
    char _empty;
};

struct SChar {
    char _empty;
};

struct UChar {
    char _empty;
};

struct Int {
    char _empty;
};

struct Long {
    char _empty;
};

struct UInt {
    char _empty;
};

struct ULong {
    char _empty;
};

struct Double {
    char _empty;
};

struct Void {
    char _empty;
};

struct FunType {
    TULong param_reg_mask;
    TULong ret_reg_mask;
    vector_t(shared_ptr_t(Type)) param_types;
    shared_ptr_t(Type) ret_type;
};

struct Pointer {
    shared_ptr_t(Type) ref_type;
};

struct Array {
    TLong size;
    shared_ptr_t(Type) elem_type;
};

struct Structure {
    TIdentifier tag;
    bool is_union;
};

union _Type {
    struct Char _Char;
    struct SChar _SChar;
    struct UChar _UChar;
    struct Int _Int;
    struct Long _Long;
    struct UInt _UInt;
    struct ULong _ULong;
    struct Double _Double;
    struct Void _Void;
    struct FunType _FunType;
    struct Pointer _Pointer;
    struct Array _Array;
    struct Structure _Structure;
};

struct Type {
    shared_ptr_impl(AST_T);
    union _Type get;
};

shared_ptr_t(Type) make_Type(void);
shared_ptr_t(Type) make_Char(void);
shared_ptr_t(Type) make_SChar(void);
shared_ptr_t(Type) make_UChar(void);
shared_ptr_t(Type) make_Int(void);
shared_ptr_t(Type) make_Long(void);
shared_ptr_t(Type) make_UInt(void);
shared_ptr_t(Type) make_ULong(void);
shared_ptr_t(Type) make_Double(void);
shared_ptr_t(Type) make_Void(void);
shared_ptr_t(Type) make_FunType(vector_t(shared_ptr_t(Type)) * param_types, shared_ptr_t(Type) * ret_type);
shared_ptr_t(Type) make_Pointer(shared_ptr_t(Type) * ref_type);
shared_ptr_t(Type) make_Array(TLong size, shared_ptr_t(Type) * elem_type);
shared_ptr_t(Type) make_Structure(TIdentifier tag, bool is_union);
void free_Type(shared_ptr_t(Type) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// static_init = IntInit(int)
//             | LongInit(int)
//             | UIntInit(int)
//             | ULongInit(int)
//             | CharInit(int)
//             | UCharInit(int)
//             | DoubleInit(string)
//             | ZeroInit(int)
//             | StringInit(identifier, bool, string)
//             | PointerInit(identifier)

struct IntInit {
    TInt value;
};

struct LongInit {
    TLong value;
};

struct UIntInit {
    TUInt value;
};

struct ULongInit {
    TULong value;
};

struct CharInit {
    TChar value;
};

struct UCharInit {
    TUChar value;
};

struct DoubleInit {
    TIdentifier dbl_const;
};

struct ZeroInit {
    TLong byte;
};

struct StringInit {
    TIdentifier string_const;
    bool is_null_term;
    shared_ptr_t(CStringLiteral) literal;
};

struct PointerInit {
    TIdentifier name;
};

union _StaticInit {
    struct IntInit _IntInit;
    struct LongInit _LongInit;
    struct UIntInit _UIntInit;
    struct ULongInit _ULongInit;
    struct CharInit _CharInit;
    struct UCharInit _UCharInit;
    struct DoubleInit _DoubleInit;
    struct ZeroInit _ZeroInit;
    struct StringInit _StringInit;
    struct PointerInit _PointerInit;
};

struct StaticInit {
    shared_ptr_impl(AST_T);
    union _StaticInit get;
};

shared_ptr_t(StaticInit) make_StaticInit(void);
shared_ptr_t(StaticInit) make_IntInit(TInt value);
shared_ptr_t(StaticInit) make_LongInit(TLong value);
shared_ptr_t(StaticInit) make_UIntInit(TUInt value);
shared_ptr_t(StaticInit) make_ULongInit(TULong value);
shared_ptr_t(StaticInit) make_CharInit(TChar value);
shared_ptr_t(StaticInit) make_UCharInit(TUChar value);
shared_ptr_t(StaticInit) make_DoubleInit(TIdentifier dbl_const);
shared_ptr_t(StaticInit) make_ZeroInit(TLong byte);
shared_ptr_t(StaticInit)
    make_StringInit(TIdentifier string_const, bool is_null_term, shared_ptr_t(CStringLiteral) * literal);
shared_ptr_t(StaticInit) make_PointerInit(TIdentifier name);
void free_StaticInit(shared_ptr_t(StaticInit) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// initial_value = Tentative
//               | Initial(static_init*)
//               | NoInitializer

struct Tentative {
    char _empty;
};

struct Initial {
    vector_t(shared_ptr_t(StaticInit)) static_inits;
};

struct NoInitializer {
    char _empty;
};

union _InitialValue {
    struct Tentative _Tentative;
    struct Initial _Initial;
    struct NoInitializer _NoInitializer;
};

struct InitialValue {
    shared_ptr_impl(AST_T);
    union _InitialValue get;
};

shared_ptr_t(InitialValue) make_InitialValue(void);
shared_ptr_t(InitialValue) make_Tentative(void);
shared_ptr_t(InitialValue) make_Initial(vector_t(shared_ptr_t(StaticInit)) * static_inits);
shared_ptr_t(InitialValue) make_NoInitializer(void);
void free_InitialValue(shared_ptr_t(InitialValue) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// identifier_attrs = FunAttr(bool, bool)
//                  | StaticAttr(initial_value, bool)
//                  | ConstantAttr(static_init)
//                  | LocalAttr

struct FunAttr {
    bool is_def;
    bool is_glob;
};

struct StaticAttr {
    bool is_glob;
    shared_ptr_t(InitialValue) init;
};

struct ConstantAttr {
    shared_ptr_t(StaticInit) static_init;
};

struct LocalAttr {
    char _empty;
};

union _IdentifierAttr {
    struct FunAttr _FunAttr;
    struct StaticAttr _StaticAttr;
    struct ConstantAttr _ConstantAttr;
    struct LocalAttr _LocalAttr;
};

struct IdentifierAttr {
    unique_ptr_impl(AST_T);
    union _IdentifierAttr get;
};

unique_ptr_t(IdentifierAttr) make_IdentifierAttr(void);
unique_ptr_t(IdentifierAttr) make_FunAttr(bool is_def, bool is_glob);
unique_ptr_t(IdentifierAttr) make_StaticAttr(bool is_glob, shared_ptr_t(InitialValue) * init);
unique_ptr_t(IdentifierAttr) make_ConstantAttr(shared_ptr_t(StaticInit) * static_init);
unique_ptr_t(IdentifierAttr) make_LocalAttr(void);
void free_IdentifierAttr(unique_ptr_t(IdentifierAttr) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// symbol = Symbol(type, identifier_attrs)

struct Symbol {
    unique_ptr_impl(AST_T);
    shared_ptr_t(Type) type_t;
    unique_ptr_t(IdentifierAttr) attrs;
};

unique_ptr_t(Symbol) make_Symbol(shared_ptr_t(Type) * type_t, unique_ptr_t(IdentifierAttr) * attrs);
void free_Symbol(unique_ptr_t(Symbol) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// struct_member = StructMember(int, type)

struct StructMember {
    unique_ptr_impl(AST_T);
    TLong offset;
    shared_ptr_t(Type) member_type;
};

unique_ptr_t(StructMember) make_StructMember(TLong offset, shared_ptr_t(Type) * member_type);
void free_StructMember(unique_ptr_t(StructMember) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// struct_typedef(int, int, identifier*, struct_member*)

#define UPtrStructMember unique_ptr_t(StructMember)
PairKeyValue(TIdentifier, UPtrStructMember);

struct StructTypedef {
    unique_ptr_impl(AST_T);
    TInt alignment;
    TLong size;
    vector_t(TIdentifier) member_names;
    hashmap_t(TIdentifier, UPtrStructMember) members;
};

unique_ptr_t(StructTypedef) make_StructTypedef(TInt alignment, TLong size, vector_t(TIdentifier) * member_names,
    hashmap_t(TIdentifier, UPtrStructMember) * members);
void free_StructTypedef(unique_ptr_t(StructTypedef) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define ulong_t unsigned long
PairKeyValue(TIdentifier, ulong_t);
PairKeyValue(TIdentifier, TIdentifier);
#define UPtrStructTypedef unique_ptr_t(StructTypedef)
PairKeyValue(TIdentifier, UPtrStructTypedef);
#define UPtrSymbol unique_ptr_t(Symbol)
PairKeyValue(TIdentifier, UPtrSymbol);
ElementKey(TIdentifier);

struct FrontEndContext {
    hashmap_t(TIdentifier, TIdentifier) string_const_table;
    hashmap_t(TIdentifier, UPtrStructTypedef) struct_typedef_table;
    hashmap_t(TIdentifier, UPtrSymbol) symbol_table;
    hashset_t(TIdentifier) addressed_set;
};

struct StructMember* get_struct_typedef_member(struct FrontEndContext* ctx, TIdentifier tag, TIdentifier member_name);
struct StructMember* get_struct_typedef_back(struct FrontEndContext* ctx, TIdentifier tag);

#endif
