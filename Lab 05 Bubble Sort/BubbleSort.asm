
//leo el primer dato
@0 //actual
    D = M

//lo guardo en el aux
@Aux1
    M =D

//leo el Segundo dato
@1 // +1
    D = M 

//Guardo el segundo dato
@Aux2
    M =D 

//Leo Aux 1
@Aux1
    D =M

//preparo primer dato
@diferencia
    M = D

//Leo Aux 1
@Aux2
    D =M

    //Calculo la diferencia
@diferencia
    M = M - D
                //+x  = es mayor; -x = es menor
    D = M // guardamos el dato en D



@Positiva
    D; JGT
        //Parte negativa
@A1
    D;JMP

//Parte Positiva
(Positiva)
@Aux2
D=M
@0
M = D
@Aux1
D=M
@1
M = D
@A1
0;JMP

(A1)
M =-1