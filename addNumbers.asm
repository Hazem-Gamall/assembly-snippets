; hello-DOS.asm - single-segment, 16-bit "hello world" program
;
; assemble with "nasm -f bin -o hi.com hello-DOS.asm"

; .com files always start 256 bytes into the segment

    ; int 21h is going to want...   
        org  100h 
.data
    msg  db "Hello, World!$"
 
.code       
    mov dx, offset msg      ; the address of or message in dx
    mov ah, 1        ; ah=9 - "print string" sub-function
    int 21h
    mov bl, al
    mov ah, 1
    int 21h
    mov cl, al 
    mov ah, 2
    add bl, cl
    sub bl, 48         
    mov dl, bl
    int 21h