
.model small
.data
    arr db 'red$','purple-red$','purple$','blue$','blue-green$','green$','yellow-green$','yellow$','orange$','orange-red$','$'
    msg db 10,10, '                  Use Complementry color wheel to pop your design             ' , '$'
    mssymbol db 10,10, '       ====================================================================','$'
    msg_color db 10,10, 'Choose a color' ,10, '0=Red ',10,'1=purple-red',10,'2=purple',10,'3=Blue',10,'4=blue-green',10,'5=green',10,'6=yellow-green',10,'7=yellow',10,'8=orange',10,'9=red-orange ): $'
    result_msg db 10,10,'Complementary color: $'
    

.code
    main proc far 
        .startup

        ; Get the user's chosen color
        ;lea dx ,mssymbol
        ;call print 
        lea dx,msg
        call print 
        lea dx ,mssymbol
        call print
        lea dx, msg_color
        call print 
        
        mov ah, 01h
        int 21h
        sub al, '0'   ; Convert ASCII to integer
        mov bl, al    ; Save the chosen color
        lea si,arr
        cmp bl ,0
          ; Display matching colors based on user input
          lea dx, result_msg
          call print
        je c_red
        cmp bl ,1
        je ppred
        cmp bl,2
        je pyellow
        
         cmp bl,3
         je borange
        
         cmp bl,4
         je bgor
        
         cmp bl,5
         je gred
         
          cmp bl,6
          je ygpr
          
          cmp bl,7
          je purple
          
          cmp bl,8
          je blue
          
          cmp bl,9
          je blueGreen 
        
    c_red:
        
        mov ah, 09h      ; DOS function to print a string
        lea dx, [si]+32   ; Load the address of the current string into DX
        int 21h
        jmp stop
    
ppred :
        mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+44
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
        
 pyellow:
     
             mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+57
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
 
 borange:
     
             mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+64
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
 bgor:
     
             mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+71
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
 

 gred:
     
             mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
     
     
 ygpr:
      
    mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+4
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
     
 purple:
     mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+15
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
     
 blue:
     mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+22
    ; Load the address of the current string into DX
     int 21h
     jmp stop 
     
 blueGreen: 
  mov dx,0
     mov ah, 09h      ; DOS function to print a string
     lea dx, [si]+27
    ; Load the address of the current string into DX
     int 21h
     jmp stop    
     
         
     

stop:
     
        .exit
 main endp       
        
        print proc near
            mov ah, 09h
            int 21h
            ret 
        print endp    
end main
