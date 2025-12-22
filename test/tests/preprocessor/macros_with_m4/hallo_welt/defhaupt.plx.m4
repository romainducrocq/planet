m4_include(`defchar.plx.m4')m4_dnl
m4_include(`defwerte.plx.m4')m4_dnl

m4_define(`Charakter', M4_CHAR($1))m4_dnl
m4_define(`Haupt', `main($1, $2)')m4_dnl
m4_define(`drucke', `print($1)')m4_dnl
m4_define(`ZeichenketteZuLang', `strtol($1, $2, $3)')m4_dnl
