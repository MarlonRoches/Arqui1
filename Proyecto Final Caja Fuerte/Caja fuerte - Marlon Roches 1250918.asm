	;  CONFIGURACION
	ContrasenaIngresada EQU 0x21
	ContrasenaADMIN 	EQU 0x22
	Reg_Contrasena1 	EQU 0x23
	Reg_Contrasena2 	EQU 0X24
	Reg_Contrasena3 	EQU 0x25
	Reg_Contrasena4 	EQU 0x26
	Reg_Contrasena5 	EQU 0x27
	Intentos			EQU 0x28
	ConteoTotal 		EQU 0x29
	TIMER 			EQU 0X30

	;  INICIO DEL PROGRAMA
	ORG 0x00
	GOTO START

	;  CODIGO
START
	BSF STATUS,5
	;---------------------------------------------------------------------------
	CLRF TRISB            ;  SALIDA PARA Contrasena e Intentos
	CLRF TRISC            ;  BITS 0 A 6 COMO SALIDAS PARA DISPLAY DE DECENAS
	CLRF TRISD            ;  PORTD SERA LA SALIDA PARA EL DISPLAY UNIDADES

	; ENTRADAS
	BSF TRISD,0           ;  BOTON MODO ADMIN
	BSF TRISD,1           ;  BOTON "OK"
	BSF TRISC,4           ;  Bit de Ingreso
	BSF TRISC,6           ;  Bit de Ingreso
	BSF TRISC,5           ;  Bit de Ingreso
	BSF TRISC,7           ;  Bit de Ingreso

	BCF TRISD,2 		  ;  LED MODO USO
	BCF TRISD,3 		  ;  LED MODO ADMIN
	;---------------------------------------------------------------------------
	BCF STATUS,5
	MOVLW b'00001011'
	MOVWF ContrasenaADMIN ;  CONTRAS DEFAULT

	MOVLW 0               ;  PARA QUE COMIENCE EN 0
	MOVWF Intentos
	movlw 0

	movwf ConteoTotal
		GOTO MENU

MENU
	;Verde
	BcF PORTD, 3
	;Azul
	BcF PORTD, 2
	call megadelay
	call megadelay
	;->->->Ir a Modo ADMIN
	BTFSC PORTD,0
		goto MODOADMIN
	;->->->Ir a Caja Fuerte
	BTFSC PORTD,1
		goto MODOCAJA

	;Verde
	BSF PORTD, 3

	;azul
	BSF PORTD, 2
	movlw b'10101111'
	movwf PORTB

	call megadelay
	call megadelay

	;;Verde
	BcF PORTD, 3
	;;azul
	BcF PORTD, 2

	movlw b'01001111'
	movwf PORTB

	GOTO MENU


OBTENERCONTRSENA

	BsF portB,4
	call megadelay
	call megadelay
	call megadelay

	;1s
	;  4 0
	BTFSC PORTC ,4
	BSF ContrasenaIngresada,0
	;  5 1

	BTFSC PORTC ,5
	BSF ContrasenaIngresada,1
	;  6 2
	BTFSC PORTC ,6
	BSF ContrasenaIngresada,2
	;  7 3
	BTFSC PORTC ,7
	BSF ContrasenaIngresada,3
	;0s
	;  4 0
	BTFSs PORTC ,4
	BcF ContrasenaIngresada,0
	;  5 1
	BTFSs PORTC ,5
	BcF ContrasenaIngresada,1
	;  6 2
	BTFSs PORTC ,6
	BcF ContrasenaIngresada,2
	;  7 3
	BTFSs PORTC ,7
	BcF ContrasenaIngresada,3

	movfw ContrasenaIngresada
	movwf portB

	call megadelay
	call megadelay

	call megadelay
	call megadelay
	BsF portB,4
	
	;->->-> Siguiente
	BTFSC PORTD,1
		RETURN
	goto OBTENERCONTRSENA

GuardarContraseNas
	; Pos4 -> Pos5
	movfw Reg_Contrasena4
	movwf Reg_Contrasena5
	; Pos3 -> Pos4
	movfw Reg_Contrasena3
	movwf Reg_Contrasena4
	; Pos2 -> Pos3
	movfw Reg_Contrasena2
	movwf Reg_Contrasena3
	; Pos1 -> Pos2
	movfw Reg_Contrasena1
	movwf Reg_Contrasena2
	; nueva -> Pos1
	movfw ContrasenaIngresada
	movwf Reg_Contrasena1
	call megadelay
	call megadelay
	return

	;----------------------------- MODO ADMIN --------------------------
MODOADMIN
	call megadelay
	call megadelay
	;;Verde
	BsF PORTD, 3
	;;azul
	BcF PORTD, 2

	
	movlw 0
	movwf portB

	;<-<-<-REGRESAR A MENU
	BTFSC PORTD,0
		goto MENU

	call megadelay
	call megadelay

	;->->->Ingresar ContrasenaADMIN
	BTFSC PORTD,1
		goto VerificarContrasenaAdmin

	call megadelay
	call megadelay

	goto MODOADMIN

VerificarContrasenaAdmin
		
	call megadelay
	call megadelay
	
	;obtenemos la Contrasena
	call OBTENERCONTRSENA

	;<-<-<-REGRESAR A MENU
	BTFSC PORTD,0
		goto MENU
	
	;->->->Ingresar ContrasenaADMIN
	BTFSC PORTD,1
		goto CheckContrasenaAdmin
	
	call megadelay
	call megadelay
	
	goto VerificarContrasenaAdmin

CheckContrasenaAdmin
	
	;;Verde
	BsF PORTD, 3
	;;azul
	BsF PORTD, 2
	call MegaDelay
	call MegaDelay
	call MegaDelay
	;;Verde
	BcF PORTD, 3
	;;azul
	BcF PORTD, 2
	call MegaDelay
	call MegaDelay
	call MegaDelay
	;;Verde
	BsF PORTD, 3
	;;azul
	BsF PORTD, 2
	call MegaDelay
	call MegaDelay
	call MegaDelay
	;;Verde
	BcF PORTD, 3
	;;azul
	BcF PORTD, 2
	call MegaDelay
	call MegaDelay
	call MegaDelay


	movFw ContrasenaIngresada
	xorwf ContrasenaADMIN, 0

	BTFSC STATUS, Z
	goto IngresarNuevaContrasena

	return
	goto MENU

IngresarNuevaContrasena
	call megadelay
	call megadelay
	;obtenemos la Contrasena
	call OBTENERCONTRSENA
	


	call GuardarContraseNas

	call megadelay
	call megadelay

	goto MENU

ErrorAdmin

	return

Alarma

	goto Alarma
	;----------------------------- MODO ADMIN --------------------------
	;----------------------------- MODO CAJA --------------------------
MODOCAJA
	
	call megadelay
	call megadelay
	
	movlw 0
	movwf portB

	;;Verde
	BCF PORTD, 3
	;;azul
	BSF PORTD, 2

	;<-<-<-REGRESAR A MENU
	BTFSC PORTD,0
	goto MENU

	call megadelay
	call megadelay

	;->->->Ingresar ContrasenaADMIN
	BTFSC PORTD,1
	goto VerificarContrasenaAdmin

	call megadelay
	call megadelay


	goto MODOCAJA

VerificarContrasenaUsuario

	return

	;----------------------------- MODO CAJA --------------------------

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;IrAAdmin
;	                      ;  cambiamos de modo
;	;modo ADMIN
;	call megadelay
;	call megadelay
;
;	BTFSC PORTD,0
;		GOTO Menu ;regresamoa al menu
;
;		call megadelay
;	call megadelay
;	;modo comparar
;
;	BTFSC PORTD,1
;		goto IngresarPrimeros4ADMIN
;
;	;rojo
;	BSF PORTD, 3
;	;azul
;	BcF PORTD, 2
;
;	movfw numero1
;	movwf portB
;	call Megadelay
;	goto IrAAdmin
;
;
;
;
;IrAComparar
;	                      ;  cambiamos de modo
;	BTFSC PORTD,0
;	BsF FlagModo,0
;
;	BTFSC PORTD,1
;	GOTO MODOCOMPARAR
;
;	GOTO Menu
;
;
;MODOCOMPARAR
;	call MegaDelay
;	call MegaDelay
;
;	;rojo
;	BcF PORTD, 3
;	;azul
;	BsF PORTD, 2
;	call megadelay
;	call megadelay
;	call megadelay
;	movfw Numero1
;	movwf PORTB
;
;
;	;BTFSC PORTD,0
;	;	GOTO Menu ;regresamoa al menu
;
;	BSF PORTD,2
;	                      ;  ingresamos primer numero
;	call megadelay
;	call IngresarPrimeros4
;
;	call megadelay
;	call megadelay
;	       ;  ok
;	                      ;  ingresamos segunda mitad
;	call IngresarSegundos4
;
;	call megadelay
;	call megadelay
;	                      ;  ok
;
;	                      ;  guardamos en el port C
;	movfw NumeroAux
;	movwf Numero2
;	call megadelay                      ;  bit vs bit
;	call megadelay
;	goto COMPARACION
;
;		                      ;  sumam
;	                      ;  regresamos
;	GOTO MODOCOMPARAR
;
;
;
;
;MostrarResultado
;	call MegaDelay
;	call MegaDelay
;
;	BSF PORTD, 3
;	BSF PORTD, 2
;
;	movFw RESULTADO
;	MOVWF PORTB
;
;	;ConteoTotal
;	BTFSC RESULTADO, 0
;	call SumarUno
;	BTFSC RESULTADO, 1
;	call SumarUno
;	BTFSC RESULTADO, 2
;	call SumarUno
;	BTFSC RESULTADO, 3
;	call SumarUno
;	BTFSC RESULTADO, 4
;	call SumarUno
;	BTFSC RESULTADO, 5
;	call SumarUno
;	BTFSC RESULTADO, 6
;	call SumarUno
;	BTFSC RESULTADO, 7
;	call SumarUno
;
;
;	movFw ConteoTotal
;	MOVWF PORTC
;
;	call MegaDelay
;	goto Loopfinal
;
;SumarUno
;	MOVLW 1
;    	addwf ConteoTotal,1
;	movf ConteoTotal,w
;	call megadelay
;	return
;
;
;IngresarPrimeros4
;	call MegaDelay
;	call MegaDelay
;
;	          call megadelay            ;  4 0
;	BTFSC PORTD ,4
;	BSF NumeroAux,0
;	                      ;  5 1
;
;	BTFSC PORTD ,5
;	BSF NumeroAux,1
;	                      ;  6 2
;	BTFSC PORTD ,6
;	BSF NumeroAux,2
;	                      ;  7 3
;
;	BTFSC PORTD ,7
;	BSF NumeroAux,3
;
;	                      ;  4 0
;
;	BTFSs PORTD ,4
;	BcF NumeroAux,0
;		                      ;  5 1
;	BTFSs PORTD ,5
;	BcF NumeroAux,1
;
;
;	                      ;  6 2
;	BTFSs PORTD ,6
;	BcF NumeroAux,2
;	                      ;  7 3
;
;
;	BTFSs PORTD ,7
;	BcF NumeroAux,3
;
;	call megadelay
;	movlw 0
;	                      ;  sumar
;	addwf NumeroAux,1
;	MOVF Numero2,W        ;  de aux1 -> fila correspondiente
;
;
;	call megadelay
;
;	                      ;  imprimimos el numero 2
;	movfw NumeroAux
;	movwf PORTC
;	call megadelay
;
;	                      ;  si le da okay, regresa al flujo
;	BTFSC PORTD,1
;	RETURN
;
;	goto IngresarPrimeros4
;
;IngresarSegundos4
;	call megadelay
;		call MegaDelay
;
;	call MegaDelay
;
;	                      ;  4 4
;	BTFSC PORTD ,4
;	BSF NumeroAux,4
;	                      ;  5 5
;	BTFSC PORTD ,5
;	BSF NumeroAux,5
;	                      ;  6 6
;	BTFSC PORTD ,6
;	BSF NumeroAux,6
;	                      ;  7 7
;	BTFSC PORTD ,7
;	BSF NumeroAux,7
;
;	                      ;  4 4
;	BTFSs PORTD ,4
;	BcF NumeroAux,4
;	                      ;  5 5
;	BTFSs PORTD ,5
;	BcF NumeroAux,5
;	                      ;  6 6
;	BTFSs PORTD ,6
;	BcF NumeroAux,6
;	                      ;  7 7
;	BTFSs PORTD ,7
;	BcF NumeroAux,7
;
;
;	movlw 0
;	                      ;  sumar
;	addwf NumeroAux,1
;	MOVF Numero2,W        ;  de aux1 -> fila correspondiente
;
;	                      ;  imprimimos el numero 1
;	movfw NumeroAux
;	movwf PORTC
;	                      ;  si le da okay, regresa
;	BTFSC PORTD,1
;	RETURN
;
;	goto IngresarSegundos4
;
;
;
;
;;-----------------------------
;IngresarPrimeros4ADMIN
;	call MegaDelay
;
;	call megadelay
;	call megadelay
;	                      ;  4 0
;	BTFSC PORTD ,4
;	BSF NumeroAux,0
;	                      ;  5 1
;		;call megadelay
;	BTFSC PORTD ,5
;	BSF NumeroAux,1
;	                      ;  6 2
;	BTFSC PORTD ,6
;	BSF NumeroAux,2
;	                      ;  7 3
;	;call megadelay
;	BTFSC PORTD ,7
;	BSF NumeroAux,3
;
;	                      ;  4 0
;	;call megadelay
;	BTFSs PORTD ,4
;	BcF NumeroAux,0
;	;call megadelay	                      ;  5 1
;	BTFSs PORTD ,5
;	BcF NumeroAux,1
;
;	;call megadelay
;	                      ;  6 2
;	BTFSs PORTD ,6
;	BcF NumeroAux,2
;	                      ;  7 3
;	;call megadelay
;
;	BTFSs PORTD ,7
;	BcF NumeroAux,3
;
;	;call megadelay
;	movlw 0
;	                      ;  sumar
;	addwf NumeroAux,1
;	MOVF Numero1,W        ;  de aux1 -> fila correspondiente
;
;
;	;call megadelay
;
;	                      ;  imprimimos el numero 2
;	movfw NumeroAux
;	movwf PORTB
;	;call megadelay
;
;	                      ;  si le da okay, regresa al flujo
;	BTFSC PORTD,1
;	goto IngresarSegundos4ADMIN
;
;	goto IngresarPrimeros4ADMIN
;
;IngresarSegundos4ADMIN
;		call MegaDelay
;
;	movlw 0
;	movwf PORTB
;	                      ;  4 4
;	BTFSC PORTD ,4
;	BSF NumeroAux,4
;	                      ;  5 5
;	BTFSC PORTD ,5
;	BSF NumeroAux,5
;	                      ;  6 6
;	BTFSC PORTD ,6
;	BSF NumeroAux,6
;	                      ;  7 7
;	BTFSC PORTD ,7
;	BSF NumeroAux,7
;
;	                      ;  4 4
;	BTFSs PORTD ,4
;	BcF NumeroAux,4
;	                      ;  5 5
;	BTFSs PORTD ,5
;	BcF NumeroAux,5
;	                      ;  6 6
;	BTFSs PORTD ,6
;	BcF NumeroAux,6
;	                      ;  7 7
;	BTFSs PORTD ,7
;	BcF NumeroAux,7
;
;
;	movlw 0
;	                      ;  sumar
;	addwf NumeroAux,1
;	MOVF Numero1,W        ;  de aux1 -> fila correspondiente
;
;
;
;
;	                      ;  imprimimos el numero 2
;	movfw NumeroAux
;	movwf PORTb
;	                      ;  si le da okay, regresa
;	BTFSC PORTD,1
;	goto  GuardarKey
;
;
;	goto IngresarSegundos4ADMIN
;;----------------------------
;
;GuardarKey
;
;	movfw NumeroAux
;	movwf Numero1
;
;	goto IrAAdmin
;
;
;
MegaDelay
	call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
	return

BIGDELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
 call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
 call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
 call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
 call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
 call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY
    call DELAY

    return


DELAY
    movlw b'11111111'
    movwf TIMER
    call DELAY2
    movlw b'11111111'
    movwf TIMER
    call DELAY2
    return

DELAY2
    decfsz TIMER, 1
    goto DELAY2
    return


;COMPARACION
;
;
;	BTFSC Numero1,0
;	BSF   Reg1,0
;	BTFSC Numero2,0
;	BSF   Reg2,0
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,0
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 0
;	BTFSC Numero1,1
;	BSF   Reg1,1
;	BTFSC Numero2,1
;	BSF   Reg2,1
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,1
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 1
;	BTFSC Numero1,2
;	BSF   Reg1,2
;	BTFSC Numero2,2
;	BSF   Reg2,2
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,2
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 2
;	BTFSC Numero1,3
;	BSF   Reg1,3
;	BTFSC Numero2,3
;	BSF   Reg2,3
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,3
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 3
;	BTFSC Numero1,4
;	BSF   Reg1,4
;	BTFSC Numero2,4
;	BSF   Reg2,4
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,4
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 4
;	BTFSC Numero1,5
;	BSF   Reg1,5
;	BTFSC Numero2,5
;	BSF   Reg2,5
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,5
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 5
;	BTFSC Numero1,6
;	BSF   Reg1,6
;	BTFSC Numero2,6
;	BSF   Reg2,6
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,6
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 6
;	BTFSC Numero1,7
;	BSF   Reg1,7
;	BTFSC Numero2,7
;	BSF   Reg2,7
;	movfw Reg1
;	xorwf Reg2,0
;	BTFSC STATUS, Z
;	BSF   Resultado,7
;	movlw 0
;	movwf Reg1
;	movwf Reg2
;; iteracion no. 7
;
;	goto MostrarResultado
;
;
LoopFinal

	BTFSC PORTD,1
	goto Start

	goto LoopFinal


	                      ;  ------------------------------------------- BORRAR
END
