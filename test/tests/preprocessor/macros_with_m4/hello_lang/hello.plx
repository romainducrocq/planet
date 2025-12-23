m4_ifdef(`JAVA_LANG', `
m4_include(`defjava.plx.m4')m4_dnl
m4_include(`MainClass.java')m4_dnl
')m4_dnl

m4_ifdef(`PYTHON_LANG', `
m4_include(`defpython.plx.m4')m4_dnl
m4_include("_main.py":)m4_dnl
m4_changequote("_`":, "_'":)m4_dnl
')m4_dnl

m4_ifdef(`RUST_LANG', `
m4_include(`defrust.plx.m4')m4_dnl
m4_include(!(main.rs);)m4_dnl
m4_changequote(!(`);, !(');)m4_dnl
')m4_dnl
