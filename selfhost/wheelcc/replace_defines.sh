#!/bin/bash

sed -i 's|#define TOK_line_break |char* m4_define_TOK_line_break = '"\"m4_define(\`TOK_line_break', \`TODO')\""'\n#define TOK_line_break |g' frontend/tokens.h
