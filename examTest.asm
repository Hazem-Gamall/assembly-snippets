org 100h

.data
msg1 db  "enter 4 array elements: $"
arr1 db 4 dup(?)  
arr2 db 4 dup(?)  
size= $-arr2      
arr3 db 8 dup(?)
freq db 0

.code                

mov ah, 9
mov dx, offset msg1
int 21h

mov cl, size
mov si, offset arr1

arrloop:
mov ah, 1
int 21h
mov [si], al      
cmp al, 35h
je count
back:
inc si
dec cl      
jnz arrloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ah, 9
mov dx, offset msg1
int 21h

mov cl, size
mov si, offset arr2

arrloop1:
mov ah, 1
int 21h
mov [si], al      
cmp al, 35h
je count1
back1:
inc si
dec cl      
jnz arrloop1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov si, offset arr1
mov bx, offset arr3
mov cl, size

merge:
mov al, [si]
mov [bx], al
inc bx
mov al, [si+4]
mov [bx], al

inc bx      
inc si
dec cl        
jnz merge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov cl, 8
mov si, offset arr3

mov ah,2
mov dl, 10
int 21h

mov ah,2
mov dl, 13
int 21h

printArr:          
mov ah, 2
mov dl, [si]
int 21h
inc si
dec cl
jnz printArr
 
     
jmp theEnd

count:
inc freq
jmp back
                  
count1:
inc freq
jmp back1
theEnd: