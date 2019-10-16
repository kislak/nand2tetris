// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(black)
@SCREEN
D=A
@addr
M=D // addr = 16384

(LOOP1)
@addr
D=M

@24576
D=A-D
@END
D;JEQ

@addr
A=M
M=-1

@addr
M=M+1

@LOOP1
0;JMP

(white)
@SCREEN
D=A
@addr
M=D // addr = 16384

(LOOP2)
@addr
D=M

@24576
D=A-D
@END
D;JEQ

@addr
A=M
M=0

@addr
M=M+1

@LOOP2
0;JMP

(END)

@24576
D=M
@white
D;JEQ
@black
D;JNE

@END // program’s end
0;JMP // infinite loop