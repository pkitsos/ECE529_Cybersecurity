# Assignment 6: Exploit Program
University of New Mexico - Dept. of Electrical and Computer Engineering  
ECE 529: Intro to Technical Cybersecurity  
Prof: Dr. Lamb - Author: Panayioti Kitsos  
Spring 2019  

## ** DISCLAIMER **
This project is meant for educational purposes only and is not to be used in any other manner. We assume no responsibility for the misuse of this project.

## DESCRIPTION:
This project contains a flawed C program designed for a 32 bit Linux system. One of the functions uses strcpy() and doesn't check the buffer bounds. By smashing the stack and moving the execution pointer to an uncalled function, the program can be exploited to execute the uncalled function. Doing this shows secret information in the form of the string "sekkrit stuff!" printed to the terminal. In this case, the attack overrides the buffer character with 13 'A' characters and overruns the base pointer with 4 'B' characters. The memory address that starts the uncalled function is then used to override the return address to run uncalled().

## TEST:
The exploit can be tested by using the following command to execute the attack.\Command: sh run.sh
