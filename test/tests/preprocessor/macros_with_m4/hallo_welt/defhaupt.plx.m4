m4_include(`defchar.plx.m4')m4_dnl
m4_include(`deftyp.plx.m4')m4_dnl
m4_include(`deffunktion.plx.m4')m4_dnl
m4_include(`defwerte.plx.m4')m4_dnl

m4_ifdef(`Programmierschnittstelle', `', `
m4_define(`StandardEA', `stdio')m4_dnl
m4_define(`StandardBib', `stdlib')m4_dnl
')m4_dnl
