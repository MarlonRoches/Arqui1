;configuration
;Inicio
    org 0x00
    goto START

    ;codigo
START
    BSF STATUS,5
    CLRF    TRISB
    BCF STATUS, RP0
    BCF STATUS, 5
    MOVLW 0X00
    MOCWF PORTB
    GOTO MENU

MENU
    CALL MV1
    CALL MV2
    GOTO MENU

MV
    MOVF DATO, W
    MOVWF PORTB

MV1
    MOVLW B'00000001'
    MOVWF DATO 
    CALL MV
    RETURN

    
MV2
    MOVLW B'00000001'
    MOVWF DATO
    CALL MV
    RETURN

END

    