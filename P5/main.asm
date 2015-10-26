;Created by EVESAN
.DEVICE "ATmega48"; definición del micro a usar para el compilador

.def a = R16; definimos a como el registro 16
.def b = R17; definimos b como el registro 17
.def c = R20; definimos c como el registro 20
.def modo = R18; definimos mode como el registro 18
.def led = R19; definimos a led el registro 19


          .org 0000 ;inicializa el stack
          ldi a, low(RAMEND); carga en a el valor bajo de RAMEND
          out spl, a ; carga el stack pointer low el valor de a
          ldi a, high(RAMEND); carga en a el valor alto de RAMEND
          out sph, a ; carga el stack pointer high el valor de a

          ldi modo, $FF; cargamos valores altos a modo
          out ddrd, modo; usamos el puerto d como salida

          ldi led, $01; inciamos el led con un $01
izq:      out portd, led; mandamos el led a portd
          rcall retardo; llamamos al retardo
          rol led ; hacemos un corrimiento con acarreo a la izquierda
          cpi led, $80 ; comparamos si el valor es igual a 0b10000000
          breq der ; si la instrucción anterior es correcta debemos saltar al bloque der
          rjmp izq ; si la instrucción de comparación no es verdadera, seguimos en el bloque izq

der:      out portd, led ; umandamos el led a puerto d
          rcall retardo ; lammamos al retardo
          ror led ; hacemos un corrimiento al a derecha con acarreo
          cpi led, $01; comparamos si el valor es igual a 0b00000001
          breq izq; si la comparación anterior es verdadera, debemos saltar al bloque de izq
          rjmp der; en caso contrario regresamos al bloque der


retardo:  ldi c, $3E ;1 CM
loop3:    ldi a, $3E ; 1 CM
loop2:    ldi b, $3E ;1 CM
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
