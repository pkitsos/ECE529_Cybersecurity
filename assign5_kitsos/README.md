# Assignment 5: Binary Analysis
University of New Mexico - Dept. Electrical and Computer Engineering
ECE 529: Intro to Technical Cybersecurity
Prof: Dr. Lamb - Author: Panayioti Kitsos 
Spring 2019

## ** DISCLAIMER **
This project is meant for educational purposes only and is not to be misused in any manner. We assume no responsibility for the misuse of this project. 

## DESCRIPTION:
The purpose of this assignment is to help students familiarize themselves with binary analysis techniques through a capture the flag (CTF) exercise. Students are provided with the executable 'msg' and encouraged to use Binutils, GDB, and Hopper to discover 4 strings. In this case, Hopper can be used to find the first 2 strings by looking through the pseudocode of the disassembled program. The first string is found hard coded within main() and the second string is acquired from the system within print_msg() and by spawning a process and invoking the 'uname' command in a shell. The program performs operations on these strings and the 3rd string is discovered by setting break points after the operations are performed. Using GDB, the contents of the %rax register at the memory address 0x0000555555554937 in print_msg() show the third string. This allows the operations performed with each iteration to be seen. The final string is found by executing the program and observing the program output.

## Results:
In this case, the flags were discovered as:
1) fubar
2) Linux
3) J<,4* 
4) SE5=3
