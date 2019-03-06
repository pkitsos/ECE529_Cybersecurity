# Assignment 7: Using ret2libc
University of New Mexico - Dept. of Electrical and Computer Engineering  
ECE 529: Intro to Technical Cybersecurity  
Prof: Dr. Lamb - Author: Panayioti Kitsos  
Spring 2019  

## ** DISCLAIMER **
This exercise is meant for educational purposes only and is not to be used in any other manner. We assume no responsibility for the misuse of this project.

## DESCRIPTION:
Netcat traditional is installed on a Linux system. The goal is to use a ret2libc exploit to spawn a remote shell on the system. The program will be executed as root and only needs to spawn the remote shell. In this case, the smash attack overrides the buffer with 13 'A' characters and overruns the base pointer with 4 'B' characters. The system address then overrides the return address and runs the payload address to spawn a bind shell hosted over a specified port via netcat.

## Instructions

Turn ASLR off so address env variable address doesn't change   
Command: sudo bash -c 'echo 0 > /proc/sys/kernel/randomize_va_space'  
NOTE: 0 - disables randomization and 2 - enables randomization  

Spawn a bind shell by running the run.sh script 
Command: sh run.sh  

NOTE: The memory addresses used for the attack are encoded in little endian and may require some tweaking. Specifically, the estimated payload address should match that of PAY_ADDR defined in run.sh, otherwise it needs to be found using GDB.

To attach to the bind shell from the attack machine, open a terminal and run the following command using the IP of the target machine and port number of the nc server.  
Command: nc -nv TARGET_IP PORT

For this example, use the following command to connect via a second terminal on the same machine over port 9999. 
Command: nc -nv 127.0.0.1 9999

To verify the bind shell is operational, test with commands like whoami, pwd, and ls.
