# Computer Architecture - Winter 2020
## Projects created during my UC Davis Computer Architecture Class

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

All these projects were created in the RARS simulator and are intended for RISC-V assembly. Each project has numerous objectives, which are detailed below.

## Design Project 1
- Given an integer (signed 32 bit) year in register x10, the program computes whether the year is a leap year. If it is, then program writes the value 1 into register x10, otherwise the program writes 0 into x10. If input is not a positive integer, program will write -1 into register x10. (lpyear.asm)
- Given two 32 bit unsigned integers in registers x10 and x11, the program calculates the greatest common divisor. The program will store the result in register x10. If either of the inputs is 0, the program will return -1 in register x10. (gcd.asm)
- Given an unsigned 32-bit number N in register x10, the program finds the Nth prime number. After finding the value of the Nth prime number, the program will store it back into register x10. If input N is 0, the program will return -1. While the program was intended to find up to the 2^31 prime number, the amount of time it takes to do so is unreasonable. The program can calculate up to the 30,000th prime without delay. (npnum.asm)
- Given an unsigned 32 bit number in register x10, the program checks if the hexadecimal representation of that number is a palindrome. For example, 0x12321 is a palindrome, but 0x1451 is not. If number is found to be a palindrome, the program stores the value 1 into register x10, and if not, stores value 0 into register x10. If the input is 0x0, the program will return the value -1. (palin.asm)

## Design Project 2
- Given the address of an null-terminated string containing an optional "+"/"-" followed by digits in register x10, the program computes the integer value of that string of digits and places it into register x10. If a non-digit character is found, the program returns -1. (atoi.asm)
- Given an address of an unsorted array of data type "word" and the size of the array in registers x10 and x11 respectively, the program should implement a selection sort algorithm. The program should modify the given array. (sort.asm)
- Given a dividend in register x10 and a divisor in registor x11, the program should perform the division operation without using division, multiplication or mod operators. The quotient should be returned in register x10 and remainder in register x11. (div.asm)
- Given the address of an array of positive 32-bit unsigned integers in register x10 and the size of the array in register x11, the program should calculate the maximum possible XOR between any two numbers present in the array and store it in register x10. For example, in the array {25, 10, 2, 8, 5, 3}, the maximum possible value is 5 XOR 25, which outputs 28. (xor.asm)

## Design Project 3
- Given a memory address of a 4kB unsorted input (1024 32-bit unsigned integers), the memory address of a 4kB output space, and the memory address of a 4kB scratch space, sort the array using insertion sort.
- Given a memory address of a 4kB unsorted input (1024 32-bit unsigned integers), the memory address of a 4kB output space, and the memory address of a 4kB scratch space, sort the array using merge sort.
- Finally, using the sorted lists given in the output of merge and insert, implement a binary search algorithm that will find the predecessor of a key K, which is the largest number in the input dataset that is smaller than K but not equal to K. 

