GCOV:
gcc frst.c -fprofile-arcs -ftest-coverage -I. -o frst

ATMEGA:

Specify ATMEL AVR instruction set or MCU type.

Instruction set avr1 is for the minimal AVR core, not supported by the C compiler, only for assembler programs ( MCU types: at90s1200, attiny10, attiny11, attiny12, attiny15, attiny28).

Instruction set avr2 (default) is for the classic AVR core with up to 8K program memory space ( MCU types: at90s2313, at90s2323, attiny22, at90s2333, at90s2343, at90s4414, at90s4433, at90s4434, at90s8515, at90c8534, at90s8535).

Instruction set avr3 is for the classic AVR core with up to 128K program memory space ( MCU types: atmega103, atmega603, at43usb320, at76c711).

Instruction set avr4 is for the enhanced AVR core with up to 8K program memory space ( MCU types: atmega8, atmega83, atmega85).

Instruction set avr5 is for the enhanced AVR core with up to 128K program memory space ( MCU types: atmega16, atmega161, atmega163, atmega32, atmega323, atmega64, atmega128, at43usb355, at94k). 

at90s2313 (AVR2):
avr-gcc frst.c -g -mmcu=at90s2313 -I. -o frst_at90s2313

atmega103 (AVR3):
avr-gcc frst.c -g -mmcu=atmega103 -I. -o frst_atmega103

atmega8 (AVR4):
avr-gcc frst.c -g -mmcu=atmega8 -I. -o frst_atmega8

atmega323 (AVR5):
avr-gcc frst.c -g -mmcu=atmega323 -I. -o frst_atmega323

ATMEGA328/P:
avr-gcc frst.c -g -mmcu=atmega329 -I. -o frst_atmega

LEON3
sparc-elf-gcc frst.c -o0 -I. -o frst_leon3

8051:
sdcc scdn.c --stack-auto -mmcs51 --iram-size 128 -I.
packihx scdn.ihx > scdn.hex
isasim scdn.hex > scdn.txt

