	                      ;  CONFIGURACI?N
	DATO EQU 0x20
	aux EQU 0x30
	OPERACION EQU 0x29
		; var Numero1 =0; asignando espacio de memoria
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
		;seteale un  TRISx [0] = 1
	BSF TRISC,0           ;  ENTRADA SAVE
	BSF TRISC,1           ;  ENTRAdA para Agregar Numero
	CLRF TRISA
	BSF TRISA,0             ;  B TODOS SON SALIDA
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

	; BTFSC if PORTC[0] == 0 osea que no hay pulsacion
	; BTFSS if PORTC[0] == 1 osea que si hay pulsacion
	BTFSc PORTC,0         ;  PORTA[0] == 0
	goto  GuardarNum1
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

	call DELAYMACHINE

	GOTO PrimerNumero     ;  TRUE recursivo

RestaurarNumero1
	MOVLW b'00000000'
	movwf PORTB
	GOTO PrimerNumero

GuardarNum1

	movf PORTB,W
	movwf NUMERO1
	call DELAYMACHINE

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
	call DELAYMACHINE

	GOTO SegundoNumero     ;  TRUE recursivo

RestaurarNumero2
	MOVLW NUMERO1 ;traemos el numero 1 intacto
	movwf PORTB
	call DELAYMACHINE
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
	call DELAYMACHINE

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
		call DELAYMACHINE


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

	call DELAYMACHINE

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
	call DELAYMACHINE

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
	call DELAYMACHINE

	goto LoopFinal

DELAYMACHINE
	;CLRF	0X20
	;BSF	0X20, 6
	;BSF	0X20, 5
	;BSF	0X20, 2
	;CALL	DELAYMACHINE2
	return

DELAYMACHINE2
	;DECFSZ	0X20, 1
	;GOTO	DELAYMACHINE2
	;RETURN


LoopFinal

	BTFSs PORTC,1         ;  PORTA[1] == 1
	GOTO LoopFinal     ;  FALSE, no se le suma recursivo

	goto START
END

;pagina 64 pdf modulo 3
