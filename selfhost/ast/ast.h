#ifndef _AST_AST_H
#define _AST_AST_H

#include "../lib/c_std.h"

#include "../ast/ast_t.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Abstract syntax tree

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct CConst;
struct CStringLiteral;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// const = ConstInt(int)
//       | ConstLong(int)
//       | ConstUInt(int)
//       | ConstULong(int)
//       | ConstDouble(double)
//       | ConstChar(int)
//       | ConstUChar(int)

struct CConstInt {
    TInt value;
};

struct CConstLong {
    TLong value;
};

struct CConstUInt {
    TUInt value;
};

struct CConstULong {
    TULong value;
};

struct CConstDouble {
    TDouble value;
};

struct CConstChar {
    TChar value;
};

struct CConstUChar {
    TUChar value;
};

union _CConst {
    struct CConstInt _CConstInt;
    struct CConstLong _CConstLong;
    struct CConstUInt _CConstUInt;
    struct CConstULong _CConstULong;
    struct CConstDouble _CConstDouble;
    struct CConstChar _CConstChar;
    struct CConstUChar _CConstUChar;
};

struct CConst {
    shared_ptr_impl(AST_T);
    union _CConst get;
};

shared_ptr_t(CConst) make_CConst(void);
shared_ptr_t(CConst) make_CConstInt(TInt value);
shared_ptr_t(CConst) make_CConstLong(TLong value);
shared_ptr_t(CConst) make_CConstUInt(TUInt value);
shared_ptr_t(CConst) make_CConstULong(TULong value);
shared_ptr_t(CConst) make_CConstDouble(TDouble value);
shared_ptr_t(CConst) make_CConstChar(TChar value);
shared_ptr_t(CConst) make_CConstUChar(TUChar value);
void free_CConst(shared_ptr_t(CConst) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// string = StringLiteral(int*)

struct CStringLiteral {
    shared_ptr_impl(AST_T);
    vector_t(TChar) value;
};

shared_ptr_t(CStringLiteral) make_CStringLiteral(vector_t(TChar) * value);
void free_CStringLiteral(shared_ptr_t(CStringLiteral) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

PairKeyValue(TIdentifier, string_t);

struct IdentifierContext {
    unsigned int label_count;
    unsigned int var_count;
    unsigned int struct_count;
    hashmap_t(TIdentifier, string_t) hash_table;
};

TIdentifier make_string_identifier(struct IdentifierContext* ctx, string_t* value);
TIdentifier make_label_identifier(struct IdentifierContext* ctx, string_t* name);
TIdentifier make_var_identifier(struct IdentifierContext* ctx, string_t* name);
TIdentifier make_struct_identifier(struct IdentifierContext* ctx, string_t* name);
#define UID_SEPARATOR "."

#endif
