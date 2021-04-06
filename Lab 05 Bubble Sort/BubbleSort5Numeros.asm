@0
D = M
@Aux1
M = D
@1
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva11
D; JGT
@A7
//SIGUIENTE COMPARACION, RAM[0] vs RAM[1]
D; JMP
(Positiva11)
// HACEMOS SWITCH
@Aux2
D = M
@0
M = D
@Aux1
D = M
@1
M = D
@A7
0; JMP
(A7)
//*+*+*+*+ Sort De [0] vs [1] COMPLETADA
@1
D = M
@Aux1
M = D
@2
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva13
D; JGT
@A15
//SIGUIENTE COMPARACION, RAM[1] vs RAM[2]
D; JMP
(Positiva13)
// HACEMOS SWITCH
@Aux2
D = M
@1
M = D
@Aux1
D = M
@2
M = D
@A15
0; JMP
(A15)
//*+*+*+*+ Sort De [1] vs [2] COMPLETADA
@2
D = M
@Aux1
M = D
@3
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva15
D; JGT
@A23
//SIGUIENTE COMPARACION, RAM[2] vs RAM[3]
D; JMP
(Positiva15)
// HACEMOS SWITCH
@Aux2
D = M
@2
M = D
@Aux1
D = M
@3
M = D
@A23
0; JMP
(A23)
//*+*+*+*+ Sort De [2] vs [3] COMPLETADA
@3
D = M
@Aux1
M = D
@4
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva17
D; JGT
@A31
//SIGUIENTE COMPARACION, RAM[3] vs RAM[4]
D; JMP
(Positiva17)
// HACEMOS SWITCH
@Aux2
D = M
@3
M = D
@Aux1
D = M
@4
M = D
@A31
0; JMP
(A31)
//*+*+*+*+ Sort De [3] vs [4] COMPLETADA
//--------------------- RONDA No. 6 COMPLETADA
@0
D = M
@Aux1
M = D
@1
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva16
D; JGT
@A42
//SIGUIENTE COMPARACION, RAM[0] vs RAM[1]
D; JMP
(Positiva16)
// HACEMOS SWITCH
@Aux2
D = M
@0
M = D
@Aux1
D = M
@1
M = D
@A42
0; JMP
(A42)
//*+*+*+*+ Sort De [0] vs [1] COMPLETADA
@1
D = M
@Aux1
M = D
@2
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva18
D; JGT
@A50
//SIGUIENTE COMPARACION, RAM[1] vs RAM[2]
D; JMP
(Positiva18)
// HACEMOS SWITCH
@Aux2
D = M
@1
M = D
@Aux1
D = M
@2
M = D
@A50
0; JMP
(A50)
//*+*+*+*+ Sort De [1] vs [2] COMPLETADA
@2
D = M
@Aux1
M = D
@3
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva20
D; JGT
@A58
//SIGUIENTE COMPARACION, RAM[2] vs RAM[3]
D; JMP
(Positiva20)
// HACEMOS SWITCH
@Aux2
D = M
@2
M = D
@Aux1
D = M
@3
M = D
@A58
0; JMP
(A58)
//*+*+*+*+ Sort De [2] vs [3] COMPLETADA
@3
D = M
@Aux1
M = D
@4
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva22
D; JGT
@A66
//SIGUIENTE COMPARACION, RAM[3] vs RAM[4]
D; JMP
(Positiva22)
// HACEMOS SWITCH
@Aux2
D = M
@3
M = D
@Aux1
D = M
@4
M = D
@A66
0; JMP
(A66)
//*+*+*+*+ Sort De [3] vs [4] COMPLETADA
//--------------------- RONDA No. 11 COMPLETADA
@0
D = M
@Aux1
M = D
@1
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva21
D; JGT
@A77
//SIGUIENTE COMPARACION, RAM[0] vs RAM[1]
D; JMP
(Positiva21)
// HACEMOS SWITCH
@Aux2
D = M
@0
M = D
@Aux1
D = M
@1
M = D
@A77
0; JMP
(A77)
//*+*+*+*+ Sort De [0] vs [1] COMPLETADA
@1
D = M
@Aux1
M = D
@2
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva23
D; JGT
@A85
//SIGUIENTE COMPARACION, RAM[1] vs RAM[2]
D; JMP
(Positiva23)
// HACEMOS SWITCH
@Aux2
D = M
@1
M = D
@Aux1
D = M
@2
M = D
@A85
0; JMP
(A85)
//*+*+*+*+ Sort De [1] vs [2] COMPLETADA
@2
D = M
@Aux1
M = D
@3
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva25
D; JGT
@A93
//SIGUIENTE COMPARACION, RAM[2] vs RAM[3]
D; JMP
(Positiva25)
// HACEMOS SWITCH
@Aux2
D = M
@2
M = D
@Aux1
D = M
@3
M = D
@A93
0; JMP
(A93)
//*+*+*+*+ Sort De [2] vs [3] COMPLETADA
@3
D = M
@Aux1
M = D
@4
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva27
D; JGT
@A101
//SIGUIENTE COMPARACION, RAM[3] vs RAM[4]
D; JMP
(Positiva27)
// HACEMOS SWITCH
@Aux2
D = M
@3
M = D
@Aux1
D = M
@4
M = D
@A101
0; JMP
(A101)
//*+*+*+*+ Sort De [3] vs [4] COMPLETADA
//--------------------- RONDA No. 16 COMPLETADA
@0
D = M
@Aux1
M = D
@1
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva26
D; JGT
@A112
//SIGUIENTE COMPARACION, RAM[0] vs RAM[1]
D; JMP
(Positiva26)
// HACEMOS SWITCH
@Aux2
D = M
@0
M = D
@Aux1
D = M
@1
M = D
@A112
0; JMP
(A112)
//*+*+*+*+ Sort De [0] vs [1] COMPLETADA
@1
D = M
@Aux1
M = D
@2
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva28
D; JGT
@A120
//SIGUIENTE COMPARACION, RAM[1] vs RAM[2]
D; JMP
(Positiva28)
// HACEMOS SWITCH
@Aux2
D = M
@1
M = D
@Aux1
D = M
@2
M = D
@A120
0; JMP
(A120)
//*+*+*+*+ Sort De [1] vs [2] COMPLETADA
@2
D = M
@Aux1
M = D
@3
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva30
D; JGT
@A128
//SIGUIENTE COMPARACION, RAM[2] vs RAM[3]
D; JMP
(Positiva30)
// HACEMOS SWITCH
@Aux2
D = M
@2
M = D
@Aux1
D = M
@3
M = D
@A128
0; JMP
(A128)
//*+*+*+*+ Sort De [2] vs [3] COMPLETADA
@3
D = M
@Aux1
M = D
@4
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva32
D; JGT
@A136
//SIGUIENTE COMPARACION, RAM[3] vs RAM[4]
D; JMP
(Positiva32)
// HACEMOS SWITCH
@Aux2
D = M
@3
M = D
@Aux1
D = M
@4
M = D
@A136
0; JMP
(A136)
//*+*+*+*+ Sort De [3] vs [4] COMPLETADA
//--------------------- RONDA No. 21 COMPLETADA
@0
D = M
@Aux1
M = D
@1
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva31
D; JGT
@A147
//SIGUIENTE COMPARACION, RAM[0] vs RAM[1]
D; JMP
(Positiva31)
// HACEMOS SWITCH
@Aux2
D = M
@0
M = D
@Aux1
D = M
@1
M = D
@A147
0; JMP
(A147)
//*+*+*+*+ Sort De [0] vs [1] COMPLETADA
@1
D = M
@Aux1
M = D
@2
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva33
D; JGT
@A155
//SIGUIENTE COMPARACION, RAM[1] vs RAM[2]
D; JMP
(Positiva33)
// HACEMOS SWITCH
@Aux2
D = M
@1
M = D
@Aux1
D = M
@2
M = D
@A155
0; JMP
(A155)
//*+*+*+*+ Sort De [1] vs [2] COMPLETADA
@2
D = M
@Aux1
M = D
@3
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva35
D; JGT
@A163
//SIGUIENTE COMPARACION, RAM[2] vs RAM[3]
D; JMP
(Positiva35)
// HACEMOS SWITCH
@Aux2
D = M
@2
M = D
@Aux1
D = M
@3
M = D
@A163
0; JMP
(A163)
//*+*+*+*+ Sort De [2] vs [3] COMPLETADA
@3
D = M
@Aux1
M = D
@4
D = M
@Aux2
M = D
@Aux1
D = M
@diferencia
M = D
@Aux2
D = M
@diferencia
M = M - D
D = M
//   '''''''''''''''''' PARTE DEL IF ''''''''''''''''''''''
@Positiva37
D; JGT
@A171
//SIGUIENTE COMPARACION, RAM[3] vs RAM[4]
D; JMP
(Positiva37)
// HACEMOS SWITCH
@Aux2
D = M
@3
M = D
@Aux1
D = M
@4
M = D
@A171
0; JMP
(A171)
//*+*+*+*+ Sort De [3] vs [4] COMPLETADA
//--------------------- RONDA No. 26 COMPLETADA

@620
0; JMP
