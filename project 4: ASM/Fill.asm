// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@place
M=0     // set starting point

(LOOP)
@KBD
D=M
@WHITE
D;JEQ   // If D=0, jump to WHITE
@BLACK
0;JMP   // Otherwise, jump to BLACK

(WHITE)
@place
D=M
@LOOP   // If D=0,jump to LOOP
D;JLT
@place
D=M
@SCREEN
A=D+A   // calculate place
M=0     // fill pixel with white
@place
M=M-1   // decrement place counter
@LOOP
0;JMP   // jump to loop


(BLACK)
@place
D=M
@8192  // Max place
D=D-A
@LOOP
D;JGE  // If D=0, jump to LOOP
@place
D=M
@SCREEN
A=D+A  // calculate place
M=-1   // fill pixel with black
@place
M=M+1  // increment place counter
@LOOP
0;JMP

(END)
@END
0;JMP

