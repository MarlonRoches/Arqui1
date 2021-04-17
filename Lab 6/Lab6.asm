	                      ;  CONFIGURACI�N
	DATO EQU 0x20
	aux EQU 0x30
	OPERACION EQU 0x20
	NUMERO1 EQU 0x21
	NUMERO2 EQU 0x22
	ESTADO EQU 0x03
	RESULTADO EQU 0x31
	DelayNum EQU 0x35
	                      ;  INICIO DE PROGRAMA
	ORG 0X00
	GOTO START

	                      ;  CODIGO
START
	                      ;  Nos Movemos a banco 1 -> status 01
	BSF STATUS,5
	CLRF TRISC
	BSF TRISC,0           ;  ENTRADA SAVE
	BSF TRISC,1           ;  ENTRAdA para Agregar Numero
	CLRF TRISA            ;  B TODOS SON SALIDA
	CLRF TRISB           ;  C TODOS SON SALIDA
	CLRF TRISD            ;  D TODOS SON SALIDA
	                      ;  limpiamos rp0, moviendonos al banco 0
	BCF STATUS,5
	                      ;  seteamos todos los leds a 0 en el inicio
	MOVLW 0
	MOVWF PORTB
	MOVWF PORTC
	MOVWF PORTD

	GOTO MENU

MENU
		;Pedimos el primer numero
	goto  PrimerNumero
		;Ingresamos el segundo numero
	goto SegundoNumero
	goto RealizarOperacion
	                      ;  delay
	                      ;  ingresamos el
	goto SeleccionarOperacion

	goto RealizarOperacion
	                      ;  BTFSS ;si el port A en A0 es =1, salta una instruccion
	BTFSS PORTA,0
	                      ;  BTFSC ;si el port A en A0 es =0, salta una instruccion

	GOTO MENU

PrimerNumero
;ch e c k
	;BsF PORTA,0           ;  se simula la entrada de un numero para sumar

	BTFSc PORTC,0         ;  PORTA[0] == 1
	call GuardarNum1
	                ;  SAVE TRUE
	                      ;  SAVE FALSE
	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO PrimerNumero     ;  FALSE, no se le suma recursivo
	                      ;  TRUE sumar
	MOVLW 0x1
	ADDWF PORTB,1
	movf PORTB,W

	;xorlw b'00010000'; pregunto si estan en 1111
	BTFSc PORTB,4
	GOTO RestaurarNumero1

	call Delay
	call Delaynt
	GOTO PrimerNumero     ;  TRUE recursivo

RestaurarNumero1
	MOVLW b'00000000'
	movwf PORTB
	GOTO PrimerNumero

GuardarNum1

	movf PORTB,W
	movwf NUMERO1
	call Delay
	call Delaynt
	goto SegundoNumero


po
;--------------------------------------------------------------------

SegundoNumero
;ch e c k
	;BsF PORTA,0           ;  se simula la entrada de un numero para sumar

	BTFSc PORTC,0         ;  PORTA[0] == 1
	goto GuardarNum2
	                ;  SAVE TRUE
	                      ;  SAVE FALSE
	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO SegundoNumero     ;  FALSE, no se le suma recursivo
	                      ;  TRUE sumar
	MOVLW 16
	ADDWF PORTB,1
	movf PORTB,W

	;xorlw b'00010000'; pregunto si estan en 1111
	;BTFSc PORTB,4
	;GOTO RestaurarNumero2
	call Delay

	GOTO SegundoNumero     ;  TRUE recursivo

RestaurarNumero2
	MOVLW NUMERO1 ;traemos el numero 1 intacto
	movwf PORTB
	call Delay
	GOTO SegundoNumero

GuardarNum2
;puerto b - numero 1
	;movf NUMERO1,W
	BTFSC PORTB ,4
	BSF NUMERO2,0
	BTFSC PORTB ,5
	BSF NUMERO2,1
	BTFSC PORTB ,6
	BSF NUMERO2,2
	BTFSC PORTB ,7
	BSF NUMERO2,3
	call Delay
	call Delaynt
	BSF PORTD, 0
	goto SeleccionarOperacion

;--------------------------------------------------------------------------------

;*********************************************************************************

SeleccionarOperacion
;ch e c k
	;PArte 1

	BTFSc PORTC,0         ;  PORTA[0] == 1
	goto GuardarOperacion
	                ;  SAVE TRUE
	                      ;  SAVE FALSE
	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO SeleccionarOperacion     ;  FALSE, no se le suma recursivo
	                      ;  TRUE sumar
	MOVLW 1
	movwf PORTD
		call Delay
	call Delaynt

	;xorlw b'00000011'; pregunto si estan en 1111
SegundaParte
	BTFSc PORTC,0         ;  PORTA[0] == 1
	goto GuardarOperacion
	                ;  SAVE TRUE
	                      ;  SAVE FALSE
	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO SegundaParte     ;  FALSE, no se le suma recursivo
	                      ;  TRUE sumar
	MOVLW 2
	movwf PORTD

	call Delay
	call Delaynt
	GOTO SeleccionarOperacion     ;  TRUE recursivo

GuardarOperacion

	movf PORTD,W
	movwf OPERACION
	goto RealizarOperacion

;**********************************************************************************

RealizarOperacion


	BTFSS PORTD,0 ; ir a suma
	goto Restar ; resta
	goto Sumar

	return
Sumar

	movf NUMERO1,W
	ADDWF NUMERO2,0 ; w = portB - numero 1
	movwf RESULTADO

	;PORTC[4]=RESULTADO[0]


	BTFSc RESULTADO ,0
	bsf PORTC,4
	;PORTC[5]=RESULTADO[1]

	BTFSc RESULTADO ,1
	bsf PORTC,5

;PORTC[6]=RESULTADO[2]

	BTFSc RESULTADO ,2
	bsf PORTC,6
;PORTC[7]=RESULTADO[3]
	BTFSc RESULTADO ,3
	bsf PORTC,7
	call Delay
	call Delaynt
	goto LoopFinal
Restar
	movf NUMERO2,W
	SUBWF NUMERO1,0 ; w = portB - numero 1
	movwf RESULTADO

	;PORTC[4]=RESULTADO[0]


	BTFSc RESULTADO ,0
	bsf PORTC,4
	;PORTC[5]=RESULTADO[1]

	BTFSc RESULTADO ,1
	bsf PORTC,5

;PORTC[6]=RESULTADO[2]

	BTFSc RESULTADO ,2
	bsf PORTC,6
;PORTC[7]=RESULTADO[3]
	BTFSc RESULTADO ,3
	bsf PORTC,7
	call Delay
	call Delaynt
	goto LoopFinal


Delay

	MOVLW 1
	ADDWF DelayNum,1
	movf DelayNum,W


	MOVLW 1
	addwf DelayNum,0
	movf DelayNum, W
	xorlw b'11111111'
	BTFSc z,0
	return
	goto Delay

Delaynt

	MOVLW 0
	movwf DelayNum
	return

LoopFinal

	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO LoopFinal     ;  FALSE, no se le suma recursivo

	goto START
END

;pagina 64 pdf modulo 3
