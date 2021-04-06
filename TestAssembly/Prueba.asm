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
    GOTO INT

Inicio
    ADDLW 0X01
    MOVWF PORTB
    GOTO INC
    
END
