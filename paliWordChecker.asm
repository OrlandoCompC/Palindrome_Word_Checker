;Orlando Companioni
;Palindrome word Checker
;The word can be very long and it will still be able to check it                        
include 'emu8086.inc'  

org 100h     

mov dx, 60
LEA di, sourceString   ;moving the string address into di,
   

 

;GET_STRING reads from DI
call GET_STRING
putc 0dh
putc 0ah   
      
   
mov cx, 0 ; Initialize counter
counting: 
mov al,[di]
cmp al,0  
je end
inc cx ;increse the counter by 1
inc di
jmp counting     ;cant use loop because the counter is 0 so I used jmp so it would go regardless
end:
           

mov si,di  ;di is already at the end so move it to si which will now hold the end
sub si,1   ;substract the null character at the end
lea di,sourceString       ;put the addr of the string back into di


rep: mov al,[di]
mov bl,[si]
cmp al,bl
jne notFound    ;jump to notFound if the letters are not the same.
inc di
dec si          ;decrease the memory add of si 
loop rep


lea si,found
call PRINT_STRING   ;PRINT_STRING uses SI register
putc 0dh
putc 0ah
jmp finish  ;jump into the finish part




notFound: 
lea si,Nfound
call PRINT_STRING
putc 0dh
putc 0ah  
 
 
finish:ret
sourceString db 60 dup(0);any spaces after the string will be 0 
found db "Found palindromic word in the input string",(0)   ;null terminator 
Nfound db "No palindromic word found",(0)                   
DEFINE_GET_STRING        
DEFINE_PRINT_STRING                


        
       



