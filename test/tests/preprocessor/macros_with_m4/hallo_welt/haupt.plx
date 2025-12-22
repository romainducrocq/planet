m4_ifdef(`Programmierschnittstelle', `', `
m4_define(`benutze', `use')m4_dnl
m4_define(`StandardEA', `stdio')m4_dnl
m4_define(`offentlich', `pub')m4_dnl
m4_define(`Funktion', `fn')m4_dnl
m4_define(`keiner', `none')m4_dnl
m4_define(`Ganz', `i32')m4_dnl
m4_define(`Zeichenkette', `string')m4_dnl
m4_define(`zuruck', `return')m4_dnl
m4_define(`Haupt', `main')m4_dnl
m4_define(`drucke', `print')m4_dnl
')m4_dnl

benutze "StandardEA"
offentlich Funktion Haupt (keiner) Ganz {
    drucke ("Hallo Welt!\n")
    zuruck 0
}

