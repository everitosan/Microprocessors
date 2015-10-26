;Created by EVESAN
.DEVICE "ATmega48" ;definicion del micro a usar para el compilador

.def a = R16; definimos a como el registro 16
.def b = R17; definimos b como el registro 17
.def c = R20; definimos c como el registro 20
.def mode = R18; definimos mode como el registro 18
.def led = R19; definimos a led el registro 19

          .org 0000 ;inicializa el stack
          ldi a, low(RAMEND); carga en a el valor bajo de RAMEND
          out spl, a ; carga el stack pointer low el valor de a
          ldi a, high(RAMEND); carga en a el valor alto de RAMEND
          out sph, a ; carga el stack pointer high el valor de a

          ldi mode, $FF; carga R17 con nivel alto
          out ddrd, mode; configura ddrc como salida


fin:      ldi led, $01; carga un valor de 1 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $02; carga un valor de 2 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $04; carga un valor de 4 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $08; carga un valor de 8 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $0F; carga un valor de 15 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $10; carga un valor de 16 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $20; carga un valor de 32 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $40; carga un valor de 64 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $80; carga un valor de 128 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo

          ldi led, $F0; carga un valor de 240 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo
          ldi led, $00; carga un valor de 0 a led
          out portd, led ; manda a d el contenido de led
          rcall retardo ; retardo


          rjmp fin


retardo:  ldi c, $30 ;1 CM
loop3:    ldi a, $30 ; 1 CM
loop2:    ldi b, $30 ;1 CM
          ;el bloque loop tarda 1000 CM por cada vez que se llame
loop:     dec b; 1 (255)
          cpi b, $00 ;1 (255)
          brne loop ;2 (255)

          dec a; 1 CM
          cpi a, $00  ; 1 CM
          brne loop2; 2CM branch if not equal
          dec c; 1 CM
          brne loop3; 1CM
          ret ;4 CM retorna a dónde fué llamado
