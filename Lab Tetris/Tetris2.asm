;CONFIG
    ESTADOROTACION EQU 0x20
    ;1 ->
    ;2 ?
    ;3 <-
    ;4 arriba
    PosX EQU 0x21
    PosY EQU 0x22
    PiezaGenerada EQU 0x23

    ;?
    Col1 EQU 0X31 ;logica Positiva
    Col2 EQU 0X32 ;logica Positiva
    Col3 EQU 0X33 ;logica Positiva
    Col4 EQU 0X34 ;logica Positiva
    Col5 EQU 0X35 ;logica Positiva
    Col6 EQU 0X36 ;logica Positiva


    AUX1 EQU 0X3A
    AUX2 EQU 0X3b
    TIMER EQU 0x3C


    FILAS EQU  PORTC   ; logica normal
    COLUMNAS EQU PORTB ; Para invertida

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
    MOVLW b'00111111'
    MOVWF PORTB         ;

    MOVLW 0
    MOVWF PORTC
    MOVWF PORTD
    MOVLW 0
    MOVWF AUX1
    MOVWF AUX2

    MOVLW b'11111111'
    movwf Col1
    movwf Col2
    movwf Col3
    movwf Col4
    movwf Col5
    movwf Col6

        MOVLW 1
        movwf PosX
        MOVLW 1
        movwf PosY

    GOTO Main

Main



    BTFSS PiezaGenerada ,0  ; hay una pieza generada? ==1?
    goto  PrimerBloque        ; no, creala
                        ; si, sigue
    ;Mostrar

    ;Opciones De Entrada
        ;Mover Izquierda
        BTFSc PORTD,0         ;BTN ? Activado
            call MOVERIZQUIERDA
            ;Mover Derecha
        BTFSc PORTD,1         ;BTN ? Activado
            call MOVERDERECHA
            ;Mover ABAJO
        BTFSc PORTD,2         ;BTN ? Activado
            goto CAIDARAPIDA
            ;Rotar
        BTFSc PORTD,3         ;BTN ? Activado
            call ROTAR


    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY
    call BIGDELAY


    call Caida
    goto Main

CAIDARAPIDA
    call CAIDA
    call print
    call BIGDELAY
    goto main



MOVERABAJO
    ;
    return

ROTAR
    ;
    return
CAIDA
    ;y0
    movf posy, w
    xorlw 6
    BTFSc status,z
        goto PrimerBloque


    ;y0
    movf posy, w
    xorlw 5
    BTFSc status,z
        goto OR56
    ;y0
    movf posy, w
    xorlw 4
    BTFSc status,z
        goto OR45

        ;y3
        movf posy, w
    xorlw 3
    BTFSc status,z
        goto OR34

    ;y0
    movf posy, w
    xorlw 2
    BTFSc status,z
        goto OR23
    ;y0
    movf posy, w

    xorlw 1
    BTFSc status,z
        goto OR12
    return

MOVERDERECHA

    ;x0
    movf posx, w
    xorlw 5
    BTFSc status,z
        goto main
    ;x0
    movf posx, w
    xorlw 4
    BTFSc status,z
        goto der45

        ;x0
    movf posx, w
    xorlw 3
    BTFSc status,z
        goto der34

    ;x0
    movf posx, w
    xorlw 2
    BTFSc status,z
        goto der23
    ;x0
    movf posx, w

    xorlw 1
    BTFSc status,z
        goto der12
    return

MOVERIZQUIERDA

    ;y0
    movf posx, w
    xorlw 1
    BTFSc status,z
        goto main
    ;y0
    movf posx, w
    xorlw 5
    BTFSc status,z
        goto izOR54

        ;y3
    movf posx, w
    xorlw 4
    BTFSc status,z
        goto izOR43

    ;y0
    movf posx, w
    xorlw 3
    BTFSc status,z
        goto izOR32
    ;y0
    movf posx, w

    xorlw 2
    BTFSc status,z
        goto izOR21
    return


;++++++++++++++++++++++++++++++++++++++
der12
     movf Col1, W
        BTFSS Col1,0
    bcf col2,0
    bsf col1,0


 movf Col1, W
        BTFSS Col1,1
    bcf col2,1
    bsf col1,1
    
     movf Col1, W
        BTFSS Col1,2
    bcf col2,2
    bsf col1,2
    
     movf Col1, W
        BTFSS Col1,0
    bcf col2,0
    bsf col1,0
    
     movf Col1, W
        BTFSS Col1,0
    bcf col2,0
    bsf col1,0
    
     movf Col1, W
        BTFSS Col1,0
    bcf col2,0
    bsf col1,0

 movf Col1, W
        BTFSS Col1,0
    bcf col2,0
    bsf col1,0
    
    return
;++++++++++++++++++++++++++++++++++++++

;---------------------------
OR12

    movf Col1, W
    BTFSS Col1,0
    bcf col1,1
    bsf col1,0
    movf col1, w
    movf Col2, W
    BTFSS Col2,0
    bcf col2,1
    bsf col2,0
    movf col2, w
    movf Col3, W
    BTFSS Col3,0
    bcf col3,1
    bsf col3,0
    movf col3, w
    movf Col4, W
    BTFSS Col4,0
    bcf col4,1
    bsf col4,0
    movf col4, w
    movf Col5, W
    BTFSS Col5,0
    bcf col5,1
    bsf col5,0
    movf col5, w
    movf Col6, W
    BTFSS Col6,0
    bcf col6,1
    bsf col6,0
    movf col6, w
    movlw 2
     movwf posy

    return

OR23

    movf Col1, W
    BTFSS Col1,1
    bcf col1,2
    bsf col1,1
    movf col1, w
    movf Col2, W
    BTFSS Col2,1
    bcf col2,2
    bsf col2,1
    movf col2, w
    movf Col3, W
    BTFSS Col3,1
    bcf col3,2
    bsf col3,1
    movf col3, w
    movf Col4, W
    BTFSS Col4,1
    bcf col4,2
    bsf col4,1
    movf col4, w
    movf Col5, W
    BTFSS Col5,1
    bcf col5,2
    bsf col5,1
    movf col5, w
    movf Col6, W
    BTFSS Col6,1
    bcf col6,2
    bsf col6,1
    movf col6, w
    movlw 3
     movwf posy

    return

OR34

    movf Col1, W
    BTFSS Col1,2
    bcf col1,3
    bsf col1,2
    movf col1, w
    movf Col2, W
    BTFSS Col2,2
    bcf col2,3
    bsf col2,2
    movf col2, w
    movf Col3, W
    BTFSS Col3,2
    bcf col3,3
    bsf col3,2
    movf col3, w
    movf Col4, W
    BTFSS Col4,2
    bcf col4,3
    bsf col4,2
    movf col4, w
    movf Col5, W
    BTFSS Col5,2
    bcf col5,3
    bsf col5,2
    movf col5, w
    movf Col6, W
    BTFSS Col6,2
    bcf col6,3
    bsf col6,2
    movf col6, w
    movlw 4
     movwf posy

    return

OR45

    movf Col1, W
    BTFSS Col1,3
    bcf col1,4
    bsf col1,3
    movf col1, w
    movf Col2, W
    BTFSS Col2,3
    bcf col2,4
    bsf col2,3
    movf col2, w
    movf Col3, W
    BTFSS Col3,3
    bcf col3,4
    bsf col3,3
    movf col3, w
    movf Col4, W
    BTFSS Col4,3
    bcf col4,4
    bsf col4,3
    movf col4, w
    movf Col5, W
    BTFSS Col5,3
    bcf col5,4
    bsf col5,3
    movf col5, w
    movf Col6, W
    BTFSS Col6,3
    bcf col6,4
    bsf col6,3
    movf col6, w
    movlw 5
     movwf posy

    return

OR56

    movf Col1, W
    BTFSS Col1,4
    bcf col1,5
    bsf col1,4
    movf col1, w
    movf Col2, W
    BTFSS Col2,4
    bcf col2,5
    bsf col2,4
    movf col2, w
    movf Col3, W
    BTFSS Col3,4
    bcf col3,5
    bsf col3,4
    movf col3, w
    movf Col4, W
    BTFSS Col4,4
    bcf col4,5
    bsf col4,4
    movf col4, w
    movf Col5, W
    BTFSS Col5,4
    bcf col5,5
    bsf col5,4
    movf col5, w
    movf Col6, W
    BTFSS Col6,4
    bcf col6,5
    bsf col6,4
    movf col6, w
    movlw 6
     movwf posy

    return

;-----------------



PRINT

    movf Col1, W ; <-11111110
    movwf PortC
    movlw b'00000001'
    movwf PortB

    movf Col2, W ; <-11111110
    movwf PortC
    movlw b'00000010'
    movwf PortB

    movf Col3, W ; <-11111110
    movwf PortC
    movlw b'00000100'
    movwf PortB

    movf Col4, W ; <-11111110
    movwf PortC
    movlw b'00001000'
    movwf PortB

    movf Col5, W ; <-11111110
    movwf PortC
    movlw b'00010000'
    movwf PortB


    movf Col6, W ; <-11111110
    movwf PortC
    movlw b'00100000'
    movwf PortB
  movlw b'00000000'
    movwf PortB

    ;call delay

    return

PrimerBloque
    movlw b'11111110'
    movwf Col1
    movwf Col2
    movlw b'00000001'

    movwf PiezaGenerada
    movwf POSX
    movwf POSY

    GOTO Main

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
    call PRINT
    decfsz TIMER, 1
    goto DELAY2
    return


END

