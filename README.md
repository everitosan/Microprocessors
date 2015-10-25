# Microprocessors  

## Structure
The structure of the repo is divided in sessions of practice. Every single folder represents a session finished.
## Hardware
The Micro used in this repo is an "ATmega48" AVR from ATMEL.  
## Generator
The current repo contains a bash file named "generator.sh".  

#### Requirements
The required packages for the Makefile to work are:
 - gavrasm  
 Compiles the .asm file to a .hex file.
 - avrdude  
Loads the -hex into the micro specified

#### Usage
With the help of that file a scaffold structure for the project may be created.
It can receive as an argument or not the name of the project as in the example below.  

 - The following command create a folder with the "Project" default name:
```sh
$ ./generator.sh
```

 - The following command create a folder with the "projectName" name:
```sh
$ ./generator.sh projectName
```

Three actions can be made by the make file: compile, flash and clean.

##### Compile
 - Will compile the asm code into a .hex file.
 ```sh
$ make
 ```

##### Flash
- Will load and flash the micro with the .hex code.
```sh
$ make flash
```

##### Clean
- Will remove the .hex and the .lst generated files.
```sh
$ make clean
```

Feel free to change the generator for your own needs.
