# planet - a C-like programming language

> **THIS LANGUAGE IS A WORK IN PROGRESS! ANYTHING CAN CHANGE AT ANY MOMENT WITHOUT ANY NOTICE! USE THIS LANGUAGE AT YOUR OWN RISK!**

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
<include> ::= ( "import" | "use" ) [ "!" ] <header-file>
<declaration> ::= <datatype-declaration> | <variable-declaration> | <function-declaration>
<datatype-declaration> ::= "type" <datatype-specifier> ( <declarator-list> | ";" )
<variable-declaration> ::= [ <storage-class> ] <declarator> ( [ "=" <initializer> ] | ";" )
<function-declaration> ::= [ <storage-class> ] "fn" <identifier> <function-declarator> <block>
<function-declarator> ::= ( <declarator-list> | "(" "none" ")" ) ( <type-name> | "none" )
<declarator> ::= <identifier> ":" <type-name>
<declarator-list> ::= "(" <declarator> { "," <declarator> } ")"
<type-name> ::= ( "*" | "[" <const> "]" ) <type-name> | <type-specifier>
<type-specifier> ::= "u8" | "i8" | "u32" | "i32" | "u64" | "i64" | "f64" | "char" | "string"
                   | "*" "any" | <datatype-specifier>
<datatype-specifier> ::= ( "struc" | "union" ) <identifier>
<storage-class> ::= "pub" | "extrn" | "data"
<block> ::= "{" [ "\n" ] <block-item> { "\n" <block-item> } [ "\n" ] "}" | ";"
<block-item> ::= <statement> | <declaration>
<initializer> ::= <exp> | "$" "(" <initializer> { "," <initializer> } ")"
<loop-init> ::= [ <variable-declaration> | <exp> ] [ "while" <exp> ] [ ".." <exp> ]
<statement> ::=  <exp> | "return" [ <exp> ] | "jump" <identifier> | "label" <identifier>
              | <block> | "if" <exp> <block> { "\n" "elif" <block> } [ "\n" "else" <block> ]
              | "loop" ( <loop-init> | ".." while <exp> ) <block> | "continue" | "break"
              | "match" <exp> <block> | "->" <const> <block> | "otherwise" <block>
<exp> ::= <unary-exp> | <exp> <binop> <exp> | "?" <exp> "then" <exp> "else" <exp>
<unary-exp> ::= <unop> <unary-exp> | "cast" "<" <type-name> ">" "(" <exp> ")"
              | "sizeof" ( "<" <type-name> ">" | "<" ">" "(" <exp> ")" )
              | <primary-exp> { <postfix-op> }
<primary-exp> ::= <const> | <identifier> | "(" <exp> ")" | { <string> }+
                | <identifier> "(" [ <exp> { "," <exp> } ] ")"
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
- [x] return 32 bit integer constants
- [x] unary arithmetic operators
- [x] binary arithmetic operators
- [x] bitwise arithmetic operators
- [x] logical and relational operators
- [ ] local variables, assignments
- [ ] compound assignments, increment operators
- [ ] if statements, conditional expressions
- [ ] jump statements, labels
- [ ] if-elif-else compound statements
- [ ] loop-while, continue, break statements
- [ ] match, ->, otherwise statements
- [ ] functions, pub storage
- [ ] top-level variables, extrn, data storage
> Types
- [ ] 32 bit and 64 bit integers
- [ ] signed and unsigned integers
- [ ] 64 bit floating-point numbers, nan
- [ ] pointers
- [ ] fixed-sized arrays, pointer arithmetic
- [ ] characters, strings literals, ascii
- [ ] any, support dynamic memory allocation
- [ ] structures
- [ ] unions
> Tooling
- [ ] process import, use, comments
- [ ] support m4 preprocessor
- [ ] glibc standard library bindings

****

@romainducrocq
