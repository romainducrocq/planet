# planet - a C-like programming language

> **THIS LANGUAGE IS A WORK IN PROGRESS! ANYTHING CAN CHANGE AT ANY MOMENT WITHOUT ANY NOTICE! USE THIS LANGUAGE AT YOUR OWN RISK!**

Development is still at a very early stage, see below for progress updates ...  
Not much to see around here for now ... Maybe check again after some time ...  

```
git clone --depth 1 --branch master --recurse-submodules --shallow-submodules https://github.com/romainducrocq/planet
```

****

### About the name

Naming is arguably the hardest open problem in Computer Science after P=NP, but there is no doubt that a great name is the key to a successful project. `planet` (acronym) stands for  _‘**p**rogramming **lan**guage **et**c.’_, as it is in fact a programming language that does stuff. It was also developed on a planet! And really, it just sounds good.

### Language grammar

```
<program> ::= { ( <declaration> | <include> ) "\n" }
<include> ::= ( "import" | "use" ) [ "!" ] "`" <header-file> "`"
<declaration> ::= <datatype-declaration> | <variable-declaration> | <function-declaration>
<datatype-declaration> ::= "type" <datatype-specifier> ( <declarator-list> | ";" )
<variable-declaration> ::= [ <storage-class> ] <declarator> ( [ "=" <initializer> ] | ";" )
<function-declaration> ::= [ <storage-class> ] "fn" <identifier> <function-declarator> <block>
<function-declarator> ::= ( <declarator-list> | "(" "none" ")" ) <maybe-type-name>
<declarator> ::= <identifier> ":" <type-name>
<declarator-list> ::= "(" <declarator> { "," <declarator> } ")"
<maybe-type-name> ::= "none" | <type-name>
<type-name> ::= ( "*" | "[" <const> "]" ) <type-name> | <type-specifier>
<type-specifier> ::= "u8" | "i8" | "u32" | "i32" | "u64" | "i64" | "f64" | "bool" | "char"
                   | "string" | "*" "any" | <datatype-specifier>
<datatype-specifier> ::= ( "struc" | "union" ) <identifier>
<storage-class> ::= "pub" | "extrn" | "data"
<block> ::= "{" [ "\n" ] <block-item> { "\n" <block-item> } [ "\n" ] "}" | ";"
<block-item> ::= <statement> | <declaration>
<initializer> ::= <exp> | "$" "(" <initializer> { "," <initializer> } ")"
<loop-init> ::= [ <variable-declaration> | <exp> ] [ "while" <exp> ] [ ".." <exp> ]
<statement> ::=  "return" ( <exp> | "none" ) | "jump" <identifier> | "label" <identifier>
              | <block> | "if" <exp> <block> { "\n" "elif" <block> } [ "\n" "else" <block> ]
              | "loop" ( <loop-init> | ".." while <exp> ) <block> | "continue" | "break"
              | "match" <exp> <block> | "->" <const> <block> | "otherwise" <block> | <exp>
<exp> ::= <unary-exp> | <exp> <binop> <exp> | "?" <exp> "then" <exp> "else" <exp>
<unary-exp> ::= <unop> <unary-exp> | "sizeof" ( "<" <type-name> ">" | "(" <exp> ")" )
              | <primary-exp> { <postfix-op> }
<primary-exp> ::= <const> | { <string> }+ | "cast" "<" <maybe-type-name> ">" "(" <exp> ")"
                | <identifier> | <identifier> "(" [ <exp> { "," <exp> } ] ")" | "(" <exp> ")"
<postfix-op> ::= "[" [ <exp> ] "]" | "." <identifier> | "++" | "--"
<unop> ::= "-" | "~" | "not" | "@" | "++" | "--"
<binop> ::= "-" | "+" | "*" | "/" | "%" | "&" | "|" | "^" | "<<" | ">>" | "and" | "or" | "=="
          | "~=" | "<" | "<=" | ">" | ">=" | "=" | "-=" | "+=" | "*=" | "/=" | "%=" | "&="
          | "|=" | "^=" | "<<=" | ">>="
<const> ::= <uint> | <ulong> | <int> | <long> | <double> | <char>
<identifier> ::= ? An identifier token ? => [a-zA-Z_]\w*
<string> ::= ? A string token ? => "([^"\\\n]|\\['"\\?abfnrtv])*"
<int> ::= "true" | "false" | "nil" | ? An int token ? => [0-9]+
<char> ::= ? A char token ? => '([^'\\\n]|\\['"?\\abfnrtv])'
<long> ::= ? An int or long token ? => [0-9]+l
<uint> ::= ? An unsigned int token ? => [0-9]+u
<ulong> ::= ? An unsigned int or unsigned long token ? => [0-9]+ul
<double> ::= ? A floating-point constant token ?
           => (([0-9]*\.[0-9]+|[0-9]+\.?)e[+\-]?[0-9]+|[0-9]*\.[0-9]+|[0-9]+\.)
<header-file> ::= ? Path to a ".etc" header file without extension ?
```

### Progress

> Language features
- [x] return 32 bit integer constants [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/1_int_constants)
- [x] unary arithmetic operators [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/2_unary_operators)
- [x] binary arithmetic operators [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/3_binary_operators)
- [x] bitwise arithmetic operators [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/3_binary_operators/valid/extra_credit)
- [x] logical and relational operators [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/4_logical_and_relational_operators)
- [x] local variables, assignments [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/5_local_variables)
- [x] compound assignments, increment operators [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/5_local_variables/valid/extra_credit)
- [x] if statements, conditional expressions [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/6_statements_and_conditional_expressions)
- [x] jump statements, labels [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/6_statements_and_conditional_expressions/valid/extra_credit)
- [x] if-elif-else compound statements [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/7_compound_statements)
- [x] loop-while, continue, break statements [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/8_loops)
- [x] match, ->, otherwise statements [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/8_loops/valid/extra_credit)
- [x] functions, pub storage [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/9_functions)
- [x] top-level variables, extrn, data storage [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/10_file-scope_variables_and_storage-class_specifiers)
> Types
- [x] 32 bit and 64 bit integers [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/11_long_integers)
- [x] signed and unsigned integers [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/12_unsigned_integers)
- [x] 64 bit floating-point numbers, nan [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/13_floating-point_numbers)
- [x] pointers [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/14_pointers)
- [x] fixed-sized arrays, pointer arithmetic [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/15_arrays_and_pointer_arithmetic)
- [x] characters, strings literals, ascii [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/16_characters_and_strings)
- [x] any, support dynamic memory allocation [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/17_supporting_dynamic_memory_allocation)
- [x] structures [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/18_structures)
- [x] unions [examples](https://github.com/romainducrocq/planet/tree/master/test/tests/compiler/18_structures/valid/extra_credit)
> Tooling
- [ ] process import, use, comments
- [ ] support m4 preprocessor
- [ ] glibc standard library bindings
- [ ] text editor themes
- [ ] readme + documentation

****

@romainducrocq
