m4_include(`defchar.plx.m4')m4_dnl
m4_include(`defhaupt.plx.m4')m4_dnl

m4_define(`Charakter', M4_CHAR($1))m4_dnl
m4_define(`Haupt', `main($1, $2)')m4_dnl
m4_define(`drucke', `print($1)')m4_dnl
m4_define(`ZeichenketteZuLang', `strtol($1, $2, $3)')m4_dnl

benutze "StandardEA"
benutze "StandardBib"

offentlich Funktion Haupt(Argumentanzahl: Ganz, Argumentwert: *Zeichenkette) Ganz {
    drucke("Hallo Welt!\n")
    Argument: Ganz = 0
    wenn Argumentanzahl == 2 {
        Argument = ZeichenketteZuLang(Argumentwert[1], nichtig, 10)    
        wenn Argument ~= Charakter(*) {
            zuruck 1
        }
    }
    zuruck Argument
}
