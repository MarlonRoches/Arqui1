//Asignamos Valores Iniciales
@Pos8

//SI ES MAYOR, SALTA
//MENOR, Sigue evaluando

(Turno1)
//Pedimos Valor
@0
D=M

@aux
M = 45

@SeCumple
D;JGT
//Parte Negativa
@1
M=-1
@Turno2
0;JMP

(SeCumple)
//PArte Positiva
@1
M=1
@Turno2
0;JMP

(Turno2)
@0
D=M