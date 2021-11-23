org 100h

.data

msg1 db "enter the first number $"
msg2 db 10,13,"enter the second number $"   
msg3 db 10,13,"result is $"
x db ?
y db ?
result db ?                            


.code

mov ah, 9
mov dx, offset msg1
int 21h

mov ah, 1
int 21h  
mov x, al
sub x, 30h
       
mov ah, 9
mov dx, offset msg2
int 21h

mov ah, 1
int 21h  
mov y, al
sub y, 30h            

mov al, x
mul y
mov result, al        

cmp result, 10      

mov ah, 9
mov dx, offset msg3
int 21h

jge gt10
jmp ngt
    
    
gt10:
mov ah, 00
mov al, result
mov bl, 10
div bl      

mov bl, ah
mov ah, 2
mov dl, al
add dl, 30h
int 21h
          
mov ah, 2
mov dl, bl  
add dl, 30h
int 21h          
jmp theend


ngt:
mov ah, 2
mov dl, result
add dl, 30h
int 21h
       
       
theend:
nop