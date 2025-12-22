m4_include(`defhaupt.plx.m4')

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
