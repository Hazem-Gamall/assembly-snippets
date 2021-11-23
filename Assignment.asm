
org 100h

.data
arr1 db 4 dup(?)
arr2 db 4 dup(?)
arr3 db 8 dup(?)    
msg1 db 0Ah,0Dh,"arr1: ",0Ah,0Dh,24h ; $ = (36)d = (24)h
msg2 db 0Ah,0Dh,"arr2: ",0Ah,0Dh,24h ; $ = (36)d = (24)h
msg3 db 0Ah,0Dh,"arr3 before sorting: ",0Ah,0Dh,24h
msg4 db 0Ah,0Dh,"arr3 after sorting: ",0Ah,0Dh,24h       
msg5 db 0Ah,0Dh,"3 showed % times$"
msg6 db 0Ah,0Dh,"frequency of 3 is $"
newline db 0Ah,0Dh,24h ;$ = (36)d = (24)h
counter db 0

.code

mov cl, 4
mov bx, offset arr1

fillArr1:

mov ah, 1
int 21h

mov [bx], al


inc bx
dec cl
jnz fillArr1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;            

mov ah, 9
mov dx, offset msg1
mov bx, offset arr1
mov cl, 4
int 21h

printArr1:
mov ah, 2
mov dl,[bx]
int 21h    
inc bx
dec cl
jnz printArr1

;move the cursor to the beginning of the next line                  
mov ah, 9
mov dx, offset newline
int 21h                  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     


mov cl, 4
mov bx, offset arr2

fillArr2:

mov ah, 1
int 21h

mov [bx], al                            


inc bx
dec cl
jnz fillArr2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
mov ah, 9
mov dx, offset msg2
mov bx, offset arr2
mov cl, 4
int 21h

printArr2:
mov ah, 2
mov dl,[bx]
int 21h    
inc bx
dec cl
jnz printArr2

;move the cursor to the beginning of the next line                  
mov ah, 9
mov dx, offset newline
int 21h  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
mov cl, 4
mov bx, offset arr1
mov si, offset arr3 

merge:

mov al,[bx]
mov [si], al   
cmp al, 33h
je found1
back1:


inc si

mov al, [bx+4]
mov [si], al

cmp al, 33h
je found2
back2:

inc si
inc bx 

dec cl
jnz merge      

jmp continue

found1:
inc counter
jmp back1
         
found2:
inc counter
jmp back2         

continue:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;      
;print merged array   

mov ah, 9
mov dx, offset msg3
int 21h            

mov bx, offset arr3
mov cl, 8

printMerge:
mov ah, 2
mov dl,[bx]
int 21h    
inc bx
dec cl
jnz printMerge

;move the cursor to the beginning of the next line                  
mov ah, 9
mov dx, offset newline
int 21h 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     

;bubble sort

mov cl, 8 
mov al, 8
mov ah, al

loop1:   
mov bx, offset arr3
dec ah
mov al, ah

loop2:          
mov dl, [bx]
cmp dl, [bx+1]
ja swap
swapBack:
inc bx
dec al
cmp al, 0
jg loop2

dec cl
jnz loop1

jmp printSort

swap:
mov dh, [bx+1]
mov [bx], dh
mov [bx+1], dl
jmp swapBack

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;      
;print sorted array
printSort:

mov ah, 9
mov dx, offset msg4
int 21h            

mov bx, offset arr3
mov cl, 8

printLoop:
mov ah, 2
mov dl,[bx]
int 21h    
inc bx
dec cl
jnz printLoop
                         
                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

printFrequency:

mov ah, 9
mov bx, offset msg5
mov cl, counter
add cl, 30h
mov [bx+11], cl
mov dx, bx
int 21h

mov ah, 9
mov dx, offset msg6
int 21h

mov ah, 2
mov dl, counter
add dl, 30h
int 21h
     


