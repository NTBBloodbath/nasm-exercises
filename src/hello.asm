;-------------------- Documentation --------------------;
; Sections:                                             ;
;   .data                                               ;
;       Where we are going to declare our global        ;
;       initialised variables and constants             ;
;   .rodata                                             ;
;       Where we are going to declare our global        ;
;       un-initialised constants                        ;
;   .bss                                                ;
;       Where we are going to declare our global        ;
;       un-initialised variables                        ;
;   .text                                               ;
;       Where we are going to define our code           ;
;                                                       ;
; Statements:                                           ;
;   DB expression [, expression ...]                    ;
;       Initializes memory with one or more byte values ;
;                                                       ;
; Directives:                                           ;
;   global (NASM specific)                              ;
;       Export symbols in the code to where it points   ;
;       in the object code generated so the linker can  ;
;       read that symbols in the object code and its    ;
;       value so it knows where to mark as an entry     ;
;       point in the output executable                  ;
;                                                       ;
; Instructions:                                         ;
;   EQU expr{, type}                                    ;
;       Assigns absolute or relocatable values          ;
;       to symbols                                      ;
;   MOV A, B                                            ;
;       Moves the elements from B to A, where           ;
;           A → destiny Register/Memory                 ;
;           B → origin Register/Memory                  ;
;                                                       ;
; Functions:                                            ;
;   (4) sys_write:                                      ;
;       RAX                                             ;
;           The function number                         ;
;       RBX                                             ;
;           Where do we want it to execute              ;
;       RCX                                             ;
;           The direction of the memory we want to      ;
;           execute                                     ;
;       RDX                                             ;
;           The size of the message in bytes            ;
;                                                       ;
; NOTES:                                                ;
;   1. RAX, RBX, RCX and RDX are just multi-purpose     ;
;   registers                                           ;
;-------------------------------------------------------;

section .data
    msg DB 'Hello World!', 10          ; 10 → \n
    ; msgSize variable is going to step on the right end of
    ; 'Hello World!' ($) and will subtract the address were
    ; our msg variable began.
    ;
    ; Thus leaving us with the bytes used for msg.
    msgSize EQU $ - msg

section .text
    global main                        ; export main symbol, default is _start

main:                                  ; our entry point
    MOV rax, 4                         ; 4     → sys_write function
    MOV rbx, 1                         ; 1     → STDOUT
    MOV rcx, msg                       ; msg   → memory
    MOV rdx, msgSize                   ; size  → message size
    int 0x80                           ; 0x80  → interruption

    MOV rax, 1                         ; 1     → exit function
    MOV rbx, 0                         ; 0     → exit code
    int 0x80                           ; 0x80  → interruption
    ret                                ; ret   → return
