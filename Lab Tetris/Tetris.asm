
    ;CONFIG
	ESTADOROTACION EQU 0x20
;1->
;2abajo
;3 <-
;4arriba
	PosX EQU 0x21
	PosY EQU 0x22
	PiezaGenerada EQU 0x23

	Fila1 EQU 0X31
	Fila2 EQU 0X32
	Fila3 EQU 0X33
	Fila4 EQU 0X34
	Fila5 EQU 0X35
	Fila6 EQU 0X36


	AUX1 EQU 0X3A
	AUX2 EQU 0X3b


	FILAS EQU  PORTC
	COLUMNAS EQU PORTB

                      ;  INICIO DE PROGRAMA
	ORG 0
	GOTO START

                      ;  CODIGO
START
                      ;  Nos Movemos a banco 1 -> status 01
    BSF STATUS,5
    CLRF TRISA            ;  A TODOS SON SALIDA
    CLRF TRISC            ;  C SALIDA DE FILAS
    CLRF TRISB            ;  B SALIDA DE COLUMNAS
    CLRF TRISD            ;  D CLEAR
    CLRF TRISE            ;  E CLEAR


    BSF TRISD,0           ;  MOVER IZQUIERDA
    BSF TRISD,1           ;  MOVER DERECHA
    BSF TRISD,2           ;  BAJAR
    BSF TRISD,3           ;  ROTAR

    BCF STATUS,5        ;  limpiamos rp0, moviendonos al banco 0
                        ;  seteamos todos los leds a 0 en el inicio
    MOVLW 0
    MOVWF PORTB         ;

    MOVWF PORTC
    MOVWF PORTD
    MOVLW 0
    MOVWF AUX1
    MOVWF AUX2

     	MOVLW b'00111111'
     	movwf fila1
	movwf fila2
	movwf fila3
	movwf fila4
	movwf fila5
	movwf fila6
	MOVLW 1
    	movwf PosX
    	MOVLW 1
    	movwf PosY

    GOTO MENU

MENU
    ;BTFSS PiezaGenerada ,0  ; hay una pieza generada?
    ;goto  NUEVAPIEZA        ; no, creala
                            ; si, sigue

;generamos nueva pieza
	MOVLW b'111110'
     movwf filas

 	MOVLW b'000001'
     movwf Columnas


	MOVLW b'00111110'
     movwf filas

 	MOVLW b'0000010'
     movwf Columnas

   ;call print
   ;110000
   ;ESTADOROTACION = 1
   ;posx 1 011000 -32 +8 = -24

	;001100 -16 +4 =-12
	;001100 -8 +2 = -6
	;000110 -4+1= -3
	;000011 tope

	;bajando datos
    ;MOVF Fila1, W
    ;MOVWF AUX1
    ;MOVF Fila2, W
    ;MOVWF AUX2
    ;movf AUX1,W
    ;IORWF AUX2, 0
    ;movwf Fila2
    ;movlw 1
    ;addwf PosY , 1








        ;Mover Izquierda
    BTFSc PORTD,0         ;BTN ← Activado
        call MOVERIZQUIERDA
        ;Mover Derecha
    BTFSc PORTD,1         ;BTN → Activado
        call MOVERDERECHA


        ;Mover ABAJO
    BTFSc PORTD,2         ;BTN ↓ Activado
        call MOVERABAJO

        ;Rotar
    BTFSc PORTD,3         ;BTN ↑ Activado
        call ROTAR

   ; call GRAVEDAD
	;call print
    ;call DELAYMACHINE      ;Llamamos al delay y alli dentro imprimimos

    GOTO MENU

;AREA TETRIS

PRINT
	;MOVLW b'111110'
     	;movwf filas

 	;MOVLW b'000001'
    ; movwf Columnas

    ;→
    MOVLW b'00000001'
    MOVWF COLUMNAS
    ;↓
    movf Fila1,w
    MOVWF FILAS
    ;↓
    MOVLW b'111111'
    MOVWF FILAS


    ;→
    MOVLW b'00000010'
    MOVWF COLUMNAS
    ;↓
    movf Fila2,w
    MOVWF FILAS
    ;↓
    MOVLW 0
    MOVWF FILAS

    ;→
    MOVLW b'00000100'
    MOVWF COLUMNAS
    ;↓
    movf Fila3,w
    MOVWF FILAS
    ;↓
    MOVLW 0
    MOVWF FILAS

    ;→
    MOVLW b'00001000'
    MOVWF COLUMNAS
    ;↓
    movf Fila4,w
    MOVWF FILAS
    ;↓
    MOVLW 0
    MOVWF FILAS

    ;→
    MOVLW b'00010000'
    MOVWF COLUMNAS
    ;↓
    movf Fila5,w
    MOVWF FILAS
    ;↓
    MOVLW 0
    MOVWF FILAS

    ;→
    MOVLW b'00100000'
    MOVWF COLUMNAS
    ;↓
    movf Fila6,w
    MOVWF FILAS
    ;↓
    MOVLW 0
    MOVWF FILAS
    MOVLW 0
    MOVWF FILAS

    return


NUEVAPIEZA

    MOVLW 1
    movwf PosX
    MOVLW 1
    movwf PosY
    movwf PiezaGenerada
    MOVLW b'111110'
    movwf Fila1
    movwf Fila2
    MOVLW 0
    MOVWF AUX1
    MOVWF AUX2

    ;call DELAYMACHINE

    goto MENU

        ;IORWF f,d ;operación OR lógica, destino = W 
GRAVEDAD
    movf PosY,W         ;traemos la posicion de y y guardamos en w
    xorlw 6             ;preguntamos si esta en 6, que es el limite
    BTFSC  Z, 0         ;Estas en el Limite Y=6?
        goto GuardarPieza   ;si, guardar pieza
    ;no, sigue bajando--------------------------------------------------------------------

    ;PosY==1
    BTFSC Fila1 ,0
    BSF Fila2,0
    BTFSC Fila1 ,5
    BSF Fila2,1
    BTFSC Fila1 ,6
    BSF Fila2,2
    BTFSC Fila1 ,7
    BSF Fila2,3
    ;PosY==2
    ;PosY==3
    ;PosY==4
    ;PosY==5

    return

GuardarPieza

    goto NUEVAPIEZA;



MOVERIZQUIERDA

	movf posx , w
	xorlw 1
	BTFSc z,0
		goto Menu


	;moviendo a la izquierda
    MOVF Fila1, W
    MOVWF AUX1
;posx 1  y orientacion 1

    MOVLW -24
    addwf AUX1,1
    MOVF AUX1, W ;de aux1 -> fila correspondiente
    MOVLW 1
    addwf POSX,1
	CALL DELAYMACHINE
		CALL DELAYMACHINE

;posx 2 y orientacion 1

    MOVLW -12
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW 1
    addwf POSX,1
	CALL DELAYMACHINE

	CALL DELAYMACHINE

;posx 3 y orientacion 1

    MOVLW -6
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW 1
    addwf POSX,1
	CALL DELAYMACHINE

	CALL DELAYMACHINE

;posx 4 y orientacion 1

    MOVLW -3
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW 1
    addwf POSX,1
	CALL DELAYMACHINE

	CALL DELAYMACHINE

;posx 5 y orientacion 1

    return


MOVERDERECHA
	;moviendo a la derecha
;posx 5 y orientacion 1
    MOVLW 3
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW -1
    addwf POSX,1

	CALL DELAYMACHINE
	CALL DELAYMACHINE
;posx 4 y orientacion 1
    MOVLW 6
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW -1
    addwf POSX,1
	CALL DELAYMACHINE
	CALL DELAYMACHINE
;posx 3 y orientacion 1
    MOVLW 12
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW -1
    addwf POSX,1
	CALL DELAYMACHINE
	CALL DELAYMACHINE
;posx 2 y orientacion 1
    MOVLW +24
    addwf AUX1,1
    MOVF AUX1, W
    MOVLW -1
    addwf POSX,1
	CALL DELAYMACHINE
	CALL DELAYMACHINE
;posx 1  y orientacion 1
    return

MOVERABAJO
    ;Hay pieza abajo?
    ;return
    ;PosY ==6? Es decir, alcanzo el limite?
    ;return
    ;mover
    return

ROTAR
    ;primera rotacion
    movf ESTADOROTACION , W
    xorlw 1
    BTFSS Z, 0 ; si es uno

    return

FINDEJUEGO
    call DELAYMACHINE
    goto FINDEJUEGO

;END AREA TETRIS




DELAYMACHINE
    CLRF	0X50
    BSF	0X50, 6
    BSF	0X50, 5
    BSF	0X50, 2
    call PRINT
    CALL	DELAYMACHINE2
    return

DELAYMACHINE2
    DECFSZ	0X50, 1
    call PRINT
    GOTO	DELAYMACHINE2
    RETURN


LoopFinal
    BTFSS PORTC,1         ;  PORTA[1] == 1
    GOTO LoopFinal     ;  FALSE, no se le suma recursivo

    goto START
    END

;pagina 64 pdf modulo 3
