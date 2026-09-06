1. format without line size limit
2. reserved keywords:  
  - type (also affects get_type_fmt)
  - then
  - match
  - string (not in sds)
  - data -> dat (only in stb_ds)
  - label
3. sizeof needs parentheses in stb_ds.h
4. (6) empty blocks in lexer.c
5. (3) functions not closing in optimizer
  - use sed in transpile.sh: sed 's/\n{/{/g'
