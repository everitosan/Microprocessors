#Definition of AVR variables for compilation and flash
DEVICE     = atmega48
CLOCK      = 1000000
PROGRAMMER = -c USBasp
#Definition of compiler, fuses and programmer
COMPILE = gavrasm main.asm
FUSES      = -U hfuse:w:0xd9:m -U lfuse:w:0x24:m
AVRDUDE = avrdude $(PROGRAMMER) -p $(DEVICE)
#Definition of available tasks
all:	main.hex
flash:	all
	$(AVRDUDE) -U flash:w:main.hex:i
main.hex:
	$(COMPILE)
clean:
	rm -f main.hex
	rm -f main.lst
