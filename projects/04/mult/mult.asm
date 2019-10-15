// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0
D=M
@n
M=D

@R1
D=M
@m
M=D

@res
M=0 // res = 0

(LOOP)
@n
D=M

@STOP
D;JEQ

@m
D=M

@res
M=D+M

@n
M=M-1

@LOOP
0;JMP

(STOP)
@res
D=M
@R2
M=D

(END)
@END
0;JMP