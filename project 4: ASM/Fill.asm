// This program fills the screen with black pixels if any key board key is pressed
// When no key is pressed, the program whitens the screen

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

