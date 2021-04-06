@Turno
M = 1
@3
D = M
//obtenemos la tecla
(QuieroTecla)
@24576
    D = M
@Tecla
M=D

@Positiva
//if
D; JGT   

//Parte negativa NO SE INGRESO LA TECLA ESPERADA
@QuieroTecla
    D;JMP

//Parte Positiva SE INGRESO UA TECLA
(Positiva)
// Buscamos que tecla se preciono

//imprimimos
// siguiente turno

(END)
@END
0;JMP
