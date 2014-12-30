; This is just placebo assembly file
    .386
    .model flat, stdcall
    option casemap :none   ; case sensitive
 
    include \masm32\include\windows.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
 
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib

    .code
 
start:
 
    jmp @F  
      szTitle    db " Placebo ",0
      szMsg      db "   Battlefield 2 is actually not installed.   ",10,
                    "   You should download and install it correctly!   ",0
    @@:
    
    MB_ICONASTERISK equ 64
                        
    push MB_ICONASTERISK
    push offset szTitle
    push offset szMsg
    push 0
    call MessageBox
    
    push 0
    call ExitProcess
 
end start
