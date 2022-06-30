;--------------------------------------------------------------;
;--------------------------------------------------------------;
;---------------------Semester project-------------------------;
;--------------------------------------------------------------;
;--------------------------------------------------------------;


pushing macro   ;----pushing----  

	
push ax
push bx
push cx
push dx
push si

endm 

 

popping macro  ;----poping----

pop si
pop dx
pop cx
pop bx
pop ax

	
endm



passing_values_Background macro val_cl,val_ch,val_dh,val_dl,c_colo
pusha
mov al,val_cl
mov change_dis_start_y,al
mov al,val_ch
mov change_dis_start_x,al
mov al,val_dh
mov change_dis_last_y,al
mov al,val_dl
mov change_dis_last_x,al
mov al,c_colo
mov change_color,al
mov al,0
popa
endm



passing_values_floor macro x_box,y_box,height_box,width_box,l_c,color_box

                pusha
                mov ax,x_box
                mov x_square,ax
                mov ax,y_box	
                mov y_square,ax
                mov ax,height_box
                mov height,ax
                mov ax,width_box
                mov wide,ax
                mov ax,l_c
                mov loop_count,ax
                mov al,color_box
                mov color,al
                mov ax,0
                popa
endm

passing_values_floor_bar macro x1_bar,y1_bar,x2_bar,y2_bar,color_bar

                pusha
                mov ax,x1_bar
                mov x1,ax
                mov ax,y1_bar
                mov y1,ax
                mov ax,x2_bar
                mov x2,ax
                mov ax,y2_bar
                mov y2,ax
                mov al,color_bar
                mov color,al
                mov ax,0
                popa
endm


.model small
.stack 100h

.data


x_coord DW 100 ;----
y_coord DW 95  ;----


number_x db 15
number_y db 6

counter_loop DW ?

isAbomb DB 0
numberOfBomb DB ?

 
firstPrime dw 47
 secondPrime  dw 13
randomNumber db ?
rangeOfRandom db 5

arr db 11 dup ( 11 dup ('0') )

color DB 5

counter db ?



    color2 db 10
    x_t dw ?
    x_y dw ?
    lc_t dw ?
    x_box dw ?
    y_box dw ?
    rand_x dw ?
    rand_y dw ?
    height_box dw ?
    width_box dw ?
    loop_count3 dw 0
    check_value dw 0
    color_box dw 0
    l_c dw ?
    x1_bar dw ?
    y1_bar dw ?
    x2_bar dw ?
    y2_bar dw ?
    color_bar dw ?
    x_square3 dw 100
    y_square3 dw 100
    x3 dw ?
    y3 dw ?
    x1 dw 200
    y1 dw 200
    x2 dw 400
    y2 dw 200
    loop_termination dw 0
    wide3 dw 100 
    height3 dw 100
	filename db "abc.txt",0
	handler dw ?
	Messege db 'Name: Faraya  Level 1: 203  Level 2: 317  level3: 90 Highest Score: 410','$'

;temp dw 0
    temp_y dw 0
    loop_count dw 0
    x_square dw 205
    y_square dw 150
    loop_control_square dw 0
   ; color db 0
    wide dw 210 
    height dw 125
    x_square_filled dw 205
    y_square_filled dw 145
    loop_control_square_filled dw 0

change_dis_start_y db 0
change_dis_start_x db 0
change_dis_last_y db 0
change_dis_last_x db 0
change_color db 10




	GettingString1 byte "Candy Crush","$"
    GettingString2 byte "PLAY GAME","$"
    GettingString3 byte "HIGH SCORE","$"
    GettingString4 byte "Developed By:","$"
    GettingString5 byte "Bilal Saleem & Faraya Baig","$"
 
    
    GettingString8 byte "----------","$"
	GettingString9 byte "NEXT","$"
	GettingString10 byte "QUIT","$"
	GettingString11 byte "GAME RULES:","$"
	
	GettingString12 byte "1)Swap 2 adjacent candies on gameboard in row/column of min 3 matching candies.","$"
	GettingString13 byte "2)Swap the candy with Bomb to crush all its occurences.","$"
	GettingString14 byte "3)There are 15 moves in each level.","$"
	GettingString15 byte "4)Combo of 3 gives 3 score while combo of 4 gives 4 scores.","$"
	GettingString16 byte "5)Minimum Score to complete each level is 15.","$"
	str17 byte "EXPLOSION","$"


;score dw 0
name_count dw 0
name_user byte 50 Dup ('$')


;==================================================================================================================================================================
loop_counter db ?
;=============================================================================GameLevels===========================================================================;
levelNumber DB ?
arrayLvl DB 100 DUP(?)  


;===========================================================================FortheBlocks===========================================================================;
blockRow DB ?
blockColumn DB ?
blockNumber DB ?



;==========================================================================ForLevels===============================================================================;
IterationRows DB ?		     
IterationColumn DB ?		     
temp DB ?


	            
;==========================================================================ForDrawingSquare========================================================================; 
squareClr DB 9
squareRow DW 0
squareCol DW 0
squareSize DW 32



;===========================================================================ForDrawingString=======================================================================;
printStringRow DB ?
printStringColumn DB ? 
printStringColor DB ?


 
;=============================================================================Pixels===============================================================================; 
columnMousePixel DW ?
rowMousePixel DW ?
boardblockRow DB ?
boardblockColumn DB ?



;===========================================================================MouseProgramming=======================================================================;
columnMouseStart DW ?
rowMouseStart DW ?
boxFillI DB ?
boxFillO DB ?


;==================================================================================================================================================================;
screenblockRow DB ?
screenblockColumn DB ?
  
 
buttonOneRow DB ?
buttonOneColumn DB ?
buttonOneIndex DB ?

buttonTwoRow DB ?
buttonTwoColumn DB ? 
buttonTwoIndex DB ?
tempIndex DW ?
 
;=========================================================================VariablesForboardbar==========================================================;
arrIndex DW ?

;==============================================================================VariablesForCrushing================================================================;
tempVar DB ?
tempVar2 DW ?
totalCols DB 10
totalRows DB 10
rowIndexCrush DB 0
colIndexCrush DB 0
iscompressing_vertically DB 0
iscompressing_horizontally DB 0
;isAbomb DB 0
;numberOfBomb DB ?
inPerpetualCrush DB 0

;=============================================================================DropNumber=========================================================================;
dropRow DB ?
dropCol DB ?
tempRow DB ?



;====================================================================RemovingBlockersHorizontallyFunctions=======================================================;
startingIndex DW ?
endingIndex DW ?
comboLength DB ?


lastColIndex DB ?



;=====================================================================VariablesForDisplayMultiDigitNumbers=======================================================;
quotient DB ?
remainder DB ?
displayNumCount DB ?
displayNumColor DB ? 
displayNumRow DB ?
displayNumCol DB ?

;=========================================================================Variables(score,totalScore,moves)======================================================;
score DW 0
totalScore DW 0
moves DW 15

;==========================================================================VariablesForPrintingWhentheGameStarts=================================================;
enterNameMSG db "Enter Your Name: ","$"
numberCrushMSG db "Number Crush Game","$"
enterLevelMSG db "Enter Level Number: ","$"
playerName db 20 DUP(?)
squareLength dw ?	; x-axis
squareWidth dw ?	; y-axis
initialSquarePixels dw ?


userName DB "Name:","$"
userMoves DB "Moves:","$"
userScore DB "Score:","$"
levelScoreMSG DB "Your score for this level is", "$"
thankYouMSG DB "Thank you for playing!", "$"
endScoreMSG DB "Your final score is", "$"


file db "myFile2.txt",0

.code

main proc
  
    mov AX, @data
    mov DS, AX

	call display1	
	
	startGame::			
				
	cmp levelNumber, 1
	je startLevelOne
	
	cmp levelNumber, 2
	je startLevelTwo
	
	cmp levelNumber, 3
	je startLevelThree
	
	startLevelOne:
		call level1
		mov al,2  


;Creating file
mov ah, 3ch
mov cx, 0
mov dx, offset filename
int 21h
mov handler, ax
mov ah, 40h
mov bx, handler
mov cx, 100
mov dx, offset Messege
int 21h
;closing file
mov ah, 3eh
mov bx, handler
int 21h

		
    mov dx,offset file   
    mov ah,3dh           


    int 21h		 
    mov bx,ax

    mov cx,0
    mov ah,40h         
    mov al,02h
    int 21h

    mov cx,14
    mov dx, offset totalScore
    mov ah,40h
int 21h


  ;close the file 


  mov  ah, 3eh          
  int  21h

		jmp removeInitialCombos

	
	startLevelTwo:
		call level2
		jmp removeInitialCombos
	
	startLevelThree:
		call level3
		
	removeInitialCombos:
		call horizontalrange	
		call verticalrange
		
		cmp iscompressing_horizontally, 1	
		je cont
		cmp iscompressing_vertically, 1
		je cont
		jmp beginGame				
	
	cont:
		call place_numbers			
		mov iscompressing_horizontally, 0
		mov iscompressing_vertically, 0
		jmp removeInitialCombos

	beginGame:	
		call printing_level 
		mov score, 0				
	
	gameLoop:
		call show_rules		
		call Mouse		
	
		jmp gameLoop	
    exitMain::
    mov AH, 4Ch
    int 21h

main endp

            Display1:

                    mov ah,0
                    mov al,12h                         
                    int 10h
                    call blue_back
                    call deck_etching                 	
					mov color , 0
                    mov wide , 245 
                    mov height , 100
                    mov x_square , 190                  
                    mov y_square , 40
                    mov loop_control_square , 0

                    call Draw_square4

                    mov color , 0
                    mov wide , 247 
                    mov height , 102
                    mov x_square , 189                  
                    mov y_square , 39
                    mov loop_control_square , 0

                    call Draw_square4

                    mov color , 0
                    mov wide , 249 
                    mov height , 104                    
                    mov x_square , 188
                    mov y_square , 38
                    mov loop_control_square , 0
                   
                   call Draw_square4

                    mov color , 0
                    mov wide , 251
                    mov height , 106                    
                    mov x_square , 187
                    mov y_square , 37
                    mov loop_control_square , 0
                    call Draw_square4

					MOV AH,02H
                    mov bh,0
                    MOV DH, 5 ;Row Number                     
                    mOV DL, 32 ;Column Number
                    INT 10H

                    mov dx,offset GettingString1                    
                    mov ah,09
                    int 21h
					
					MOV AH,02H
                    mov bh,0
                    MOV DH, 12 ;Row Number                
                    mOV DL, 25 ;Column Number
                    INT 10H

					mov dx,offset GettingString4                      
                    mov ah,09
                    int 21h

                    MOV AH,02H
                    mov bh,0
                    MOV DH, 15  ;Row Number
                    mOV DL, 25 ;Column Number
                    INT 10H
										
					 mov dx,offset GettingString5                        
                    mov ah,09                                 
                    int 21h

                   
                    MOV AH,02H
                    mov bh,0
                    MOV DH, 21 ;Row Number                     
                    mOV DL, 32 ;Column Number
                    INT 10H

                   	MOV AH,02H
                    mov bh,0
                    MOV DH, 20 ;Row Number                      
                    mOV DL, 72 ;Column Number
                    INT 10H

                    mov dx,offset GettingString9                     
                    mov ah,09                                  
                    int 21h
		
mouse_count:
                    mov ax,01h
                    int 33h
                    mov ax,03h
                    int 33h
                    cmp bx,1
                    jne mouse_count
                    cmp cx,570
                    jb mouse_count
                    cmp cx,615
                    ja mouse_count
                    cmp dx,313
                    jb mouse_count
                    cmp dx,343
                    ja mouse_count
					call second_display
                    

   Second_display:
	
				 	mov ah,0
                    mov al,12h                              
                    int 10h

                    call blue_back

                    mov color , 0
                    mov wide , 245 
                    mov height , 100
                    mov x_square , 190                    
                    mov y_square , 40
                    mov loop_control_square , 0
                    call Draw_square4

                    mov color , 0
                    mov wide , 247 
                    mov height , 102                     
                    mov x_square , 189
                    mov y_square , 39
                    mov loop_control_square , 0
                    call Draw_square4

                    mov color , 0
                    mov wide , 249 
                    mov height , 104                    
                    mov x_square , 188                  
                    mov y_square , 38
                    mov loop_control_square , 0
                    call Draw_square4

                    mov color , 0
                    mov wide , 251
                    mov height , 106                               
                    mov x_square , 187
                    mov y_square , 37
                    mov loop_control_square , 0

                    call Draw_square4

                    mov color , 0
                    mov wide , 85 
                    mov height , 25
                    mov x_square , 265                  
                    mov y_square , 233
                    mov loop_control_square , 0

                    call Draw_square4

                    mov color , 0
                    mov wide , 45 
                    mov height , 25
                    mov x_square , 281                
                    mov y_square , 267
                    mov loop_control_square , 0

                    call Draw_square4
					
					call deck_etching
					 
					MOV AH,02H
                    mov bh,0
                    MOV DH, 5 ;Row Number                     
                    mOV DL, 32 ;Column Number
                    INT 10H

                    mov dx,offset GettingString1                        
                    mov ah,09
                    int 21h

					MOV AH,02H
                    mov bh,0
                    MOV DH, 15 ;Row Number
                    mOV DL, 34 ;Column Number
                    INT 10H

                    mov dx,offset GettingString2                       
                    mov ah,09
                    int 21h

                    MOV AH,02H
                    mov bh,0
                    MOV DH, 17  ;Row Number
                    mOV DL, 36 ;Column Number
                    INT 10H

                    mov dx,offset GettingString10                      
                    mov ah,09
                    int 21h
					
					MOV AH,02H
                    mov bh,0
                    MOV DH, 21 ;Row Number                     
                    mOV DL, 1;Column Number
                    INT 10H
						
					mov dx,offset GettingString12                       
                    mov ah,09                                 
                    int 21h

					MOV AH,02H
                    mov bh,0
                    MOV DH, 22 ;Row Number                     
                    mOV DL, 1;Column Number
                    INT 10H

					mov dx,offset GettingString13                      
                    mov ah,09                                 
                    int 21h
					
						MOV AH,02H
                    mov bh,0
                    MOV DH, 23 ;Row Number                     
                    mOV DL, 1;Column Number
                    INT 10H

					mov dx,offset GettingString14					
                    mov ah,09                                 
                    int 21h
					
						MOV AH,02H
                    mov bh,0
                    MOV DH, 24 ;Row Number                     
                    mOV DL, 1;Column Number
                    INT 10H

					mov dx,offset GettingString15                      
                    mov ah,09                                 
                    int 21h
					
						MOV AH,02H
                    mov bh,0
                    MOV DH, 25 ;Row Number                     
                    mOV DL, 1;Column Number
                    INT 10H

					mov dx,offset GettingString16                      
                    mov ah,09                                 
                    int 21h
										
					jmp S_Display   

	S_Display:
					MOV AH,02H
                    mov bh,0
                    MOV DH, 25 ;Row Number
                    mOV DL, 0 ;Column Number
                    INT 10H 


                    mouse_count_Display2:
                    mov ax,01h
                    int 33h
                    mov ax,03h
                    int 33h
                    cmp bx,1
                    jne mouse_count_Display2

                    cmp cx,285
                    jb change
                    cmp cx,323
                    ja change
                    cmp dx,270
                    jb change
                    cmp dx,290
                    ja change
                    jmp exitmain

                    change:
                    cmp cx,270
                    jb mouse_count_Display2
                    cmp cx,345
                    ja mouse_count_Display2
                    cmp dx,235
                    jb mouse_count_Display2
                    cmp dx,259
                    ja mouse_count_Display2                    
					call interface
					jmp startgame
                  

blue_back proc

    pushing
    mov ah,06h ;scroll up window
	mov al,0
	mov cx,0
	mov dh,80
	mov dl,80
	mov bh,5
	int 10h
    popping

    ret
blue_back endp

 drawbar proc
pushing
	
	mov bx, 0
	mov cx, x_coord   ; starting point cx x-axis
	mov dx, y_coord  ; depth  y-axis

	topbar:

		mov ah, 0ch    ;write graphics pixel
		mov al, color   
		push bx
		mov bh,0  
		int 10h
		pop bx
		
		inc cx
		inc bx
		cmp bx, 400; 
		jb topbar
	popping
		ret
drawbar endp


drawbackground proc
	pushing 
	mov loop_counter , 100
	A:
		dec loop_counter
		dec loop_counter
		cmp loop_counter , 0
		jne A
		je B
	B:
		popping
ret
drawbackground endp

;=================================================================Draw_square4======================================================================================;
                Draw_square4 proc   
                    pushing
                    check:

                        cmp height,0
                        je finish
                        dec height
                        inc y_square
                        mov cx,wide

                        Draw_square5:

                            mov ah,0ch ;writing pixels
                            mov al,color
                            mov loop_count,cx
                            mov cx,x_square
                            mov dx,y_square
                            int 10h
                            inc x_square
                            mov cx,loop_count
                        loop Draw_square5
                        mov cx,wide
                        x_set:
                            dec x_square
                            loop x_set
                    jmp check
                    finish:
                        popping
                    ret                    
                Draw_square4 endp 

;==================================================================================upright bar=====================================================================;
upright_bar proc

pushing
	mov bx, 0
	mov cx, x_coord   
	mov dx, y_coord  
	topbar:

		mov ah, 0ch    
		mov al, color  
		push bx
		mov bh,0   
		int 10h
		pop bx
		
		inc dx
		inc bx
		cmp bx, 310; 

		jb topbar
		
	popping
	
		ret
upright_bar endp

;==================================================================================deck etching====================================================================;


                deck_etching proc

                    pushing

                    mov x_square,0
                    mov y_square,440
                    mov height,40
                    mov wide,40
                    mov color2,10
                    mov loop_count,0

                    passing_values_floor x_square,y_square,40,640,0,20

                    call Draw_square4

                    passing_values_floor_bar 0,440,640,440,10

                    call bar

                    passing_values_floor_bar 0,460,640,460,10

                    call bar

                    mov x1,20
                    mov y1,440
                    mov x2,20
                    mov y2,480 
                    
                    bricks_printing1:

                                    mov cx,x1
                                    cmp cx,640
                                    je outer_bricks1
                                    passing_values_floor_bar x1,440,x2,480,10
                                    call bar
                                    add x1,20
                                    add x2,20

                    jmp bricks_printing1

                    outer_bricks1:

                                    mov x1,10
                                    mov x2,10
                                    random_bar1:
                                    mov cx,x1
                                    cmp cx,640
                                    jae outer_bricks2 
                                    passing_values_floor_bar x1,440,x2,450,3
                                    call bar
                                    add x1,40
                                    add x2,40

                    jmp random_bar1

                    outer_bricks2:

                                    mov x1,0
                                    mov x2,20
                                    mov y1,450
                                    mov y2,450
                                    random_bar2:
                                    mov cx,x1
                                    cmp cx,640
                                    jae outer_bricks3
                                    passing_values_floor_bar x1,y1,x2,y2,3
                                    call bar
                                    add x1,20
                                    add x2,40

                    jmp random_bar2

                    outer_bricks3:

                                    mov x1,30
                                    mov x2,30
                                    random_bar3:
                                    mov cx,x1
                                    cmp cx,640
                                    jae outer_bricks4
                                    passing_values_floor_bar x1,440,x2,460,3
                                    call bar
                                    add x1,40
                                    add x2,40

                    jmp random_bar3

                    outer_bricks4:

                                    mov x1,30
                                    mov x2,30
                                    random_bar4:
                                    mov cx,x1
                                    cmp cx,640
                                    jae outer_bricks5
                                    passing_values_floor_bar x1,470,x2,480,3
                                    call bar
                                    add x1,40
                                    add x2,40

                    jmp random_bar4

                    outer_bricks5:

                                    mov x1,10
                                    mov x2,10
                                    random_bar5:
                                    mov cx,x1
                                    cmp cx,640
                                    jae outer_bricks6	
                                    passing_values_floor_bar x1,460,x2,480,3
                                    call bar
                                    add x1,40
                                    add x2,40

                    jmp random_bar5

                    outer_bricks6:

                                    mov x1,20
                                    mov x2,40
                                    random_bar6:
                                    mov cx,x1
                                    cmp cx,640
                                    jae ending
                                    passing_values_floor_bar x1,470,x2,470,3
                                    call bar
                                    add x1,20
                                    add x2,40

                    jmp random_bar6

                    ending:

                        popping

                    ret

                deck_etching endp

;===========================================================================End of procedure========================================================================;

;======================================================================bar procedure starts from here===============================================================;

                bar proc
                    pushing
                    mov cx,y2
                    cmp y1,cx
                    je x_loop

                    y_loop:

                        mov cx,y2
                        cmp y1,cx
                        je returning
                        mov ah,0ch
                        mov al,color2
                        mov cx,x1
                        mov dx,y1
                        int 10h
                        inc y1

                    jmp y_loop

                    x_loop:

                        mov cx,x2
                        cmp x1,cx
                        je returning
                        mov ah,0ch
                        mov al,color2
                        mov cx,x1
                        mov dx,y1
                        int 10h
                        inc x1

                    jmp x_loop
                    returning:

                        popping

                    ret

                bar endp

;=============================================================================End of procedure======================================================================;

;======================================================================board printing procedures starts=============================================================; 
printing_board proc 

;push ax
;push bx
;push cx
;push dx
;push si
pushing

mov counter_loop,0

horizontal:

call drawbar
add  y_coord,31
;;inc color

inc counter_loop

mov ax,counter_loop

cmp ax,11

jb horizontal
mov color,5
mov x_coord , 100
mov y_coord , 95
mov counter_loop,0

verticle:

call upright_bar
add  x_coord,40
;inc color

inc counter_loop

mov ax,counter_loop

cmp ax,11

jb verticle

;call number_bar1
;call number_bar2
;call number_bar3
;call number_bar4
;call number_bar5
;call number_bar6
;call number_bar7
;call number_bar8
;call number_bar9
;call number_bar10

popping

ret
printing_board endp
;=============================================================================End of procedure======================================================================;




;============================================================================Random number procedure================================================================;
create_random_number proc     
    
    pushing
    
	genAgain:
		mov AX, firstPrime  
		mov BX, 1
		mul BX
		
		add AX, secondPrime 
		mov BH, rangeOfRandom
		div BH
				  
		mov randomNumber, AH
		inc randomNumber             
		
		cmp isAbomb, 1		
		jne cont
		mov CL, randomNumber
		cmp CL, numberOfBomb
		jne cont
		mov firstPrime, AX
		mov secondPrime, DX
		jmp genAgain
	
	cont:
		mov firstPrime, AX
		mov secondPrime, DX
popping

    ret
        
create_random_number endp
;=============================================================================End of procedure======================================================================;


level1 proc

push SI
push CX
push BX
    	
mov SI, 0
mov CX, 100

mov firstPrime, 47
mov secondPrime, 13
mov rangeOfRandom, 5		
fillLoop:  
    call create_random_number
    mov BL, randomNumber
    mov arrayLvl[SI], BL  
    inc SI
    loop fillLoop      

mov ah, 0
mov al, 12h
int 10h
		   
pop BX
pop CX
pop SI
ret    
                                                                                                                                                                                                                                                                
level1 endp                                                                                      
;============================================================================End of procedure======================================================================;

level2 proc
pushing    
mov SI, 0

mov AX, 0	; ROW
mov DX, 0	; COL

mov rangeOfRandom, 5
mov firstPrime, 47
mov secondPrime, 13

fillLoop_Row:
	mov DL, 0
	
	fillLoop_Col:
		cmp AL, 2				 
		jbe checkCornerColumns
		cmp AL, 7				
		jae checkCornerColumns
		cmp AL, 4				
		je checkCentreColumns	
		cmp AL, 5				
		je checkCentreColumns	
		jmp genNum
	
		checkCornerColumns:	 
			cmp DL, 2
			jbe genBlankNum
			cmp DL, 7
			jae genBlankNum
			jmp genNum
		
		checkCentreColumns:	
			cmp DL, 3
			jb genNum
			cmp DL, 6
			ja genNum
	
		genBlankNum:
			push AX
			push DX
			
			mov DL, totalRows
			mul DL
			
			pop DX
			add AL, DL
			mov SI, AX
			pop AX
								
			mov arrayLvl[SI], 7  
			jmp cont
		
		genNum:
			push AX
			push DX
			
			mov DL, totalRows
			mul DL
			
			pop DX
			add AL, DL
			mov SI, AX
			pop AX
						
			call create_random_number
			cmp randomNumber, 1
			je fillN
			dec randomNumber
			
			fillN:
				mov BL, randomNumber		
				mov arrayLvl[SI], BL  

		cont:
			inc DL
			cmp DL, 10
			jne fillLoop_Col
		
		inc AL
		cmp AL, 10
		jne fillLoop_Row
		call drawbackground
  
  popping
  ret    
                                                                                                                                                                                                                                                                
level2 endp  
;==========================================================================End of procedure========================================================================;


level3 proc
pushing    
mov SI, 0
mov CX, 100

mov rangeOfRandom, 6		
mov firstPrime, 47
mov secondPrime, 13

fillLoop:  
    call create_random_number
    mov BL, randomNumber
	cmp BL, 6
	jne normalNum
    mov arrayLvl[SI], 'X'		
	jmp cont
	
	normalNum:		
		mov arrayLvl[SI], BL
	
	cont:
		inc SI
		loop fillLoop      
		call drawbackground
    popping 
ret    		  
level3 endp    
;==========================================================================End of procedure========================================================================;



   
;=======================================================================Printing block procedure starts============================================================;
block proc
    
    push AX
    push BX
    push CX
    push DX
        
    mov DH, blockRow
    mov DL, blockColumn
    
    mov AH, 02h		  
    int 10h
    
    mov AL, blockNumber      
	cmp AL, 0	   
	je drawZero
	
	cmp AL, 'B'
	je drawBomb
	
	cmp AL, 'X'
	jne cont
	
	mov BL, 0Fh		  
	mov AL, 'X'
	mov BH, 0
	mov CX, 1
	jmp exit
		
	drawBomb:
		mov BL, 0Dh		 
		mov AL, 'B'
		mov BH, 0
		mov CX, 1
		jmp exit
	
	drawZero:		
		mov BL,	0Eh
		jmp next
	
	cont:
		mov BL, AL        
	next:
		add AL, 48		  
		mov BH, 0		  
		mov CX, 1		  
    
	exit:
    mov AH, 9h
    int 10h    
    
    pop DX
    pop CX
    pop BX
    pop AX
    
ret    
block endp     
;===========================================================================End of procedure======================================================================;

;==============================================================================Black box proc=========================================================================;
black proc
pushing


	mov squareRow, 88
	mov squareCol, 148
	mov squareSize, 96
	mov squareClr, 0Ch ;write graphics pixel
	
                    mov color , 0    
                    mov wide , 95 
                    mov height , 107
                    mov x_square , 148                    
                    mov y_square , 75
                    mov loop_control_square , 0
                    call Draw_square4
					
	
	mov squareRow, 88
	mov squareCol, 370

 mov color , 0    
                    mov wide , 95 
                    mov height , 107
                    mov x_square , 373                  
                    mov y_square , 75
                    mov loop_control_square , 0
                    call Draw_square4


	
	mov squareRow, 311
	mov squareCol, 147

                           mov color , 0     
                    mov wide , 95 
                    mov height , 107
                    mov x_square , 148                    
                    mov y_square , 311
                    mov loop_control_square , 0
                    call Draw_square4

	;Bottom Right
	mov squareRow, 311
	mov squareCol, 370

 mov color , 0     
                    mov wide , 95 
                    mov height , 107
                    mov x_square , 373                   
                    mov y_square , 311
                    mov loop_control_square , 0
                    call Draw_square4
					
	
	;Middle
	mov CX, 243	; COL
	mov DX, 216	; ROW

 mov color , 0     
                    mov wide , 125 
                    mov height , 62
                    mov x_square , 245                    
                    mov y_square , 216
                    mov loop_control_square , 0
                    call Draw_square4
	call drawbackground
	popping
		ret
black endp   
;===========================================================================End of procedure======================================================================;

;=======================================================================drawing_grid procedure starts=============================================================;
drawing_grid proc

pushing	
		
	mov squareClr, 2
	mov squareRow, 88
	mov squareCol, 148
	mov squareSize, 32
	mov counter_loop, 0
	mov DX, squareSize

	mov SI, 0
	printLoop:

cmp levelNumber,0
je changecolor
jne B
changecolor:
mov color,2
mov al,[color]	
B:

		cmp counter_loop, 10
		je finishPrint   
		
		mov CX, 10
		printRow:
			cmp arrayLvl[SI], 'B'
			je setBombblockColumnor
			cmp arrayLvl[SI], 'X'
			jne cont
			mov bl,color
			mov squareClr, bl	
			jmp cont
			
			setBombblockColumnor:
				mov squareClr, 4
		
			cont:
				call printing_square  
				add squareCol, 32
		

		
	mov squareClr, al  
	                   ;setting color
				inc SI
				loop printRow
	 
		add squareRow, 32
		mov squareCol, 148
		inc counter_loop
		jmp printLoop
	 
	finishPrint:   
		cmp levelNumber, 2
		jne finish
		call black		

	finish:
	popping
			call drawbackground
ret             
drawing_grid endp 
;===========================================================================End of procedure======================================================================;

;=======================================================================Printing_level procedure starts============================================================;
printing_level proc 
   
   push SI
   
   mov AH, 0h            
   mov AL, 12h
   int 10h     
   
   mov blockRow, 6		
   mov blockColumn, 20
  
   mov SI, 0			
   mov IterationRows, 0		
   mov IterationColumn, 0		
   
   mov AL, blockColumn		
   mov temp, AL
   
	rowLoop:
		mov IterationColumn, 0
		
		colLoop:
			cmp levelNumber, 2				 
			jne draw
			
			cmp IterationRows, 2				
			jbe checkCornerColumns
			cmp IterationRows, 7				
			jae checkCornerColumns
			cmp IterationRows, 4				
			je checkCentreColumns	
			cmp IterationRows, 5				
			je checkCentreColumns	
			jmp draw
	
		checkCornerColumns:				 
			cmp IterationColumn, 2
			jbe nextIter
			cmp IterationColumn, 7
			jae nextIter
			jmp draw
		
		checkCentreColumns:				
			cmp IterationColumn, 3
			jb draw
			cmp IterationColumn, 6
			ja draw		
			jmp nextIter
     
        draw:
            mov DH, arrayLvl[SI]		
			cmp DH, 7
			jb continue				
			cmp DH, 'B'
			je continue
			cmp DH, 'X'
			je continue
			jmp nextIter
			
		continue:	
			mov blockNumber, DH
			call block
	
		nextIter:
			add blockColumn, 4
			inc SI
			
			inc IterationColumn
			cmp IterationColumn, 10
			jb ColLoop
    
		mov AL, temp
		mov blockColumn, AL		
		add blockRow, 2
		inc IterationRows
		cmp IterationRows, 10
		jb rowLoop
	
    call drawing_grid        
    call drawbackground
   pop SI
	ret

printing_level endp 
;===========================================================================End of procedure======================================================================;

;=======================================================================Printing_square procedure starts============================================================;
printing_square PROC

	push DX
	push CX
	push AX
	
	mov BX, 0
	mov AX, squareSize            
	mov DX, squareRow
	mov CX, squareCol
	
	push CX
	push DX
	push AX
	call drawing_Horizontalbar
	call drawing_Verticalbar
	
	pop AX
	pop DX
	add DX, AX
	dec DX
	push DX
	push AX
	call drawing_Horizontalbar
	
	pop AX
	pop DX
	mov DX, squareRow
	pop CX
	add CX, AX   
	dec CX
	push CX
	push DX
	push AX
	call drawing_Verticalbar
	
	call drawbackground
	pop AX
	pop DX 
	pop CX 
	pop AX
	pop CX 
	pop DX  
	
	ret
	
printing_square ENDP
;===========================================================================End of procedure======================================================================;

;=======================================================================drawing_horizontalbar procedure starts====================================================;
drawing_Horizontalbar proc   
    push bp     
    mov bp, sp
   
    mov BX, [bp + 4]	; squareSize
    mov DX, [bp + 6]
    mov CX, [bp + 8]
    
	push AX
	
	mov AX, 0
	
	printbar:
		cmp AX, BX
		je exitPrintbar
		
		push AX
		mov AH, 0Ch 
		mov BH, 0
		mov AL, squareClr
		int 10h
		         
	    pop AX	         
		inc AX
		inc CX
		jmp printbar
	
	exitPrintbar:
		call drawbackground
		pop AX    
		pop bp
		ret 
		
drawing_Horizontalbar ENDP
;===========================================================================End of procedure======================================================================;

;=======================================================================drawing_horizontalbar procedure starts====================================================;
drawing_Verticalbar proc
	push bp     
    mov bp, sp
   
    mov BX, [bp + 4]
    mov DX, [bp + 6]
    mov CX, [bp + 8]

	push AX
	
	mov AX, 0
	
	printbarA:
		cmp AX, BX
		je exitPrintbarA
		   
		push AX   
		mov AH, 0Ch
		mov BH, 0
		mov AL, squareClr
		int 10h
		
		pop AX
		inc AX
		inc DX
		jmp printbarA
	
	exitPrintbarA:
		call drawbackground
		pop AX    
		pop bp
		ret
		
drawing_Verticalbar ENDP
;===========================================================================End of procedure======================================================================;

;=======================================================================printing_string procedure starts==========================================================;
printing_string proc
	push AX
	push BX
	push DX
		
	mov DH, printStringRow
	mov DL, printStringColumn
	
	drawLoop:
		mov AH, [SI]
		cmp AH, '$'
		je exit
		
		mov AH, 02h
		int 10h

		mov AH, 09h
		mov AL, [SI]
		mov BH, 0
		mov BL, printStringColor 
		mov CX, 1
		int 10h
		
		inc DL
		inc SI
		jmp drawLoop
exit:
	pop DX
	pop BX
	pop AX
	ret
	
printing_string endp  
;===========================================================================End of procedure======================================================================; 
 
;=======================================================================show_rules procedure starts==========================================================;
show_rules proc
    
    push SI
    
    mov printStringRow, 0
    mov printStringColumn, 0
    mov printStringColor, 4
    lea SI, userName
    call printing_string  

	call printPlayerName
	
	
	
    mov printStringRow, 0			
    mov printStringColumn, 35 
    mov printStringColor, 2
    lea SI, userMoves
    call printing_string  

	mov ax, moves				
	mov displayNumColor, 0Ah
	mov displayNumCol, 42
	mov displayNumRow, 0
	call Show_Two_Digit_Num
	
    mov printStringRow, 0			
    mov printStringColumn, 68
    mov printStringColor, 3
    lea SI, userScore
    call printing_string
	
	mov ax, score				
	mov displayNumColor, 0Bh
	mov displayNumCol, 75
	mov displayNumRow, 0
	call Show_Two_Digit_Num
	call drawbackground
    pop SI
    ret 

show_rules endp 
;===========================================================================End of procedure======================================================================;


;=======================================================================printing_string procedure starts==========================================================;
boardTileToScreenTile proc
	push AX
	push BX

	mov AL, boardblockColumn
	mov BL, 4
	mul BL
	add AL, 20
	mov screenblockColumn, AL
	
	mov AL, boardblockRow
	mov BL, 2
	mul BL
	add AL, 6
	mov screenblockRow, AL
	call drawbackground
	pop BX
	pop AX
	ret
boardTileToScreenTile endp 
;===========================================================================End of procedure======================================================================; 


;==============================================================converting pixel to tile procedure starts==========================================================;
convert_pixelToTile proc
	push AX
	push BX
	
	sub columnMousePixel, 148				
	sub rowMousePixel, 88
    
    cmp columnMousePixel, 0              
    jne next 
    mov boardblockColumn, 0
    jmp cont
   
    next:  
	mov AX, 0
	mov AX, columnMousePixel
	mov BL, 32
	div BL
	mov boardblockColumn, AL
    
    cont:
    cmp rowMousePixel, 0
    jne next2
    mov boardblockRow, 0
    jmp retFN 
    
    next2:
	mov AX, 0
	mov AX, rowMousePixel
	div BL
	mov boardblockRow, AL
    
    retFN:
	pop BX
	pop AX
	ret

convert_pixelToTile endp
;===========================================================================End of procedure======================================================================;	


;==============================================================converting tile to pixel procedure starts==========================================================;
convert_tileToPixel proc
    push AX
    push DX
    
    mov AX, 0
    mov AL, 32
    mul boardblockColumn
    
    add AX, 148
    mov columnMousePixel,AX
    
    mov AX, 0
    mov AL, 32
    mul boardblockRow
    
    add AX, 88
    mov rowMousePixel, AX  
    
    pop DX
    pop AX
    ret
	
convert_tileToPixel endp	
;===========================================================================End of procedure======================================================================;

;=========================================================================mouse procedure starts==================================================================;
Mouse proc
	mov AX, 1			
	int 33h

	mov AX, 3			
	int 33h
	
	cmp BX, 1			
	je checkMousePix
	jmp exit
	
	checkMousePix:
		mov columnMousePixel, CX
		mov rowMousePixel, DX
		
		cmp columnMousePixel, 148		
		jb exit
		
		cmp columnMousePixel, 468
		ja exit
		
		cmp rowMousePixel, 88
		jb exit

		cmp rowMousePixel, 408
		ja exit
		
		cmp levelNumber, 2
		jne cont
		
		; Ensuring mouse pointer is not within restricted areas of level 2
		
		cmp rowMousePixel, 184				
		jbe checkCornerColumns
		
		cmp rowMousePixel, 312				
		jae checkCornerColumns
		
		cmp rowMousePixel, 216				
		jb cont	
		
		cmp rowMousePixel, 280				
		ja cont	
		jmp checkCentreColumns
	
		checkCornerColumns:				 
			cmp columnMousePixel, 244
			jbe exit
			
			cmp columnMousePixel, 372
			jae exit
			jmp cont
		
		checkCentreColumns:				
			cmp columnMousePixel, 244
			jna cont
			
			cmp columnMousePixel, 372
			ja cont
			jmp exit
			
		cont:
			call convert_pixelToTile		
			call convert_tileToPixel		
				
			mov AX, columnMousePixel		
			mov squareCol, AX
			mov AX, rowMousePixel
			mov squareRow, AX
			mov squareClr, 10
			mov squareSize, 32
			call printing_square			
			
			inc squareCol		
			call printing_square			
			
			call boardbar	
			mov AX, arrIndex
			mov buttonOneIndex, AL
			mov AH, boardblockColumn		
			mov buttonOneColumn, AH
			mov AH, boardblockRow
			mov buttonOneRow, AH

			call Mouse_release
				
	exit:
		call drawbackground
		ret

Mouse endp 
;===========================================================================End of procedure======================================================================;

;=================================================================mouse realease procedure starts=================================================================;
Mouse_release proc
	
	checkLoop:
		mov AX, 3			
		int 33h

		cmp BX, 0				
		jne checkLoop
		
		mov columnMousePixel, CX
		mov rowMousePixel, DX
		
		cmp columnMousePixel, 148		
		jb exit
		
		cmp columnMousePixel, 468
		ja exit
		
		cmp rowMousePixel, 88
		jb exit

		cmp rowMousePixel, 408
		ja exit
		
		cmp levelNumber, 2
		jne cont	
		
		cmp rowMousePixel, 184				 
		jbe checkCornerColumns
		
		cmp rowMousePixel, 312				
		jae checkCornerColumns
		
		cmp rowMousePixel, 216				
		jb cont	
		
		cmp rowMousePixel, 280				
		ja cont	
		jmp checkCentreColumns
	
		checkCornerColumns:				 
			cmp columnMousePixel, 244
			jbe exit
			
			cmp columnMousePixel, 372
			jae exit
			jmp cont
		
		checkCentreColumns:				
			cmp columnMousePixel, 244
			jna cont
			
			cmp columnMousePixel, 372
			ja cont
			jmp exit
			
		cont:
		call convert_pixelToTile		
		call convert_tileToPixel		
		
		mov AX, columnMousePixel		
		mov squareCol, AX
		mov AX, rowMousePixel
		mov squareRow, AX
		mov squareClr, 10
		mov squareSize, 32
		call printing_square

		inc squareCol		
		call printing_square
			
		call boardbar
		mov AX, arrIndex
		mov buttonTwoIndex, AL
		mov AH, boardblockColumn		
		mov buttonTwoColumn, AH
		mov AH, boardblockRow
		mov buttonTwoRow, AH
		
		call checkswap		
		call drawbackground
		ret
		
	exit:   
		mov squareClr, 9
		call drawing_grid
		ret
Mouse_release endp
;===========================================================================End of procedure======================================================================;

;=========================================================================boardbar procedure starts==================================================================;
boardbar proc

	push AX
	push BX
 	
	mov AL, boardblockRow
	mov BL, 10
	mul BL
	
	mov BH, 0
	mov BL, boardblockColumn
	
	add AX, BX 
	mov arrIndex, AX
	
	pop BX
	pop AX
	ret
	
boardbar endp
;===========================================================================End of procedure======================================================================;

;=========================================================================boxFill procedure starts==================================================================;
boxFill proc
	push CX
	push DX
	push AX
		
	mov boxFillO, 0
	mov CX, columnMouseStart
	mov DX, rowMouseStart
	
	outerloop:
		mov boxFillI, 0
		
		innerloop:
			mov AH, 0ch ;write pixel
			mov AL, 09h ;write character
			int 10h
			inc boxFillI
			inc CX
			cmp boxFillI, 32
			jb innerloop
		
		mov CX, columnMouseStart
		inc DX
		inc boxFillO
		cmp boxFillO, 32
		jb outerloop
	
	pop AX
	pop DX
	pop CX
	ret
boxFill endp
;===========================================================================End of procedure======================================================================;
 
;=========================================================================checkswap procedure starts==================================================================;
checkswap proc

	mov AH, buttonOneColumn
	mov AL, buttonOneRow

	mov BH, buttonTwoColumn
	mov BL, buttonTwoRow

	cmp AH, BH		
	jne sameRow
	
	sameCol:
		cmp BL, AL 			
		ja secondRowLarger
		cmp BL, AL
		jb secondRowSmaller	 
		jmp exit			 
		
		secondRowLarger:		
			mov CL, BL		
			mov DL, AL		
			sub CL, DL
			cmp CL, 1		
			jne exit
			cmp BL, 9		
			ja exit			
			
			call swapTilesifpossible
			jmp exit
			
		secondRowSmaller:  
			mov CL, BL		 
			mov DL, AL		
			sub DL, CL
			cmp DL, 1		
			jne exit
			cmp BL, 0		
			jb exit			
			
			call swapTilesifpossible
			jmp exit
	
	sameRow:
		cmp AL, BL		
		je checkcol
		jmp exit
		
	checkcol:
		cmp BH,AH
		ja secondColLarger	
		cmp BH, AH
		jb secondColSmaller	
		jmp exit
		
		secondColLarger:
			mov CL, BH		
			mov DL, AH		
			sub CL, DL
			cmp CL, 1		
			jne exit
			cmp BH, 9
			ja exit			
			
			call swapTilesifpossible
			jmp exit
		
		secondColSmaller:
			mov CL, BH		
			mov DL, AH		
			sub DL, CL
			cmp DL, 1		
			jne exit
			cmp BL, 0
			jb exit			
			
			call swapTilesifpossible
			jmp exit
	
	exit:				
		mov squareClr, 9	
		call drawing_grid	
		call drawbackground
		ret

checkswap endp
;===========================================================================End of procedure======================================================================;


;=========================================================================swapTilesifpossible procedure starts==============================================================;
swapTilesifpossible proc
	push AX
	push BX
	push CX
	push DX
	push SI

	mov BH, 0				
	mov BL, buttonOneIndex
	mov SI, BX
	mov tempIndex, BX
	
	mov DH, arrayLvl[SI]	
	
	mov BH, 0
	mov BL, buttonTwoIndex		
	mov SI, BX
		
	mov CL, arrayLvl[SI]	
	
	cmp DH, 'X'		
	je exitIfBlocker
	cmp CL, 'X'
	je exitIfBlocker
	
	cmp DH, 'B'			
	je checkBombFirst
	jmp checkBombSecond	
	
	checkBombFirst:		
		cmp CL, 'B'		
		je ifBomb
		
		mov AL, CL		
		call blast_bomb
		call printing_level
		call place_numbers
		jmp normalFinish
		
		ifBomb:			
			mov squareClr, 9
			call drawing_grid
			jmp normalFinish
	
	checkBombSecond:    
		cmp CL, 'B'		
		jne swap		
		mov AL, DH		
		call blast_bomb
		call printing_level
		call place_numbers
		jmp normalFinish
		
	swap:
		mov arrayLvl[SI], DH		
		mov SI, tempIndex
		mov arrayLvl[SI], CL
		
	normalFinish:	
		call constant_crushing
		dec moves				
		cmp moves, 0			
		jne exitIfBlocker		
		cmp levelNumber, 3			 
		jb goToNextLevel		
		call End_Message	
		
		goToNextLevel:
			call NextLevel
		
		 call horizontalrange	
		 call verticalrange
		
	exitIfBlocker:	
	 	mov AX, 1
		int 33h

		call drawbackground
		pop SI
		pop DX
		pop CX
		pop BX
		pop AX
	ret	

swapTilesifpossible endp
;===========================================================================End of procedure======================================================================; 

;===============================================================slowdown by one second procedure starts===========================================================; 
slowdown_by_one_second proc
	push ax
	push cx
	push dx
	
	mov cx, 0Fh				; Add time delay of 1 sec
	mov dx, 4240h
	mov ah, 86h
	int 15h 		

	pop dx
	pop cx
	pop ax
	ret
slowdown_by_one_second endp  
;===========================================================================End of procedure======================================================================;

;=========================================================================Nextlevel procedure starts==============================================================;
NextLevel proc

	push ax
	mov ah, 0		
	mov al, 12h
	int 10h
	
	;call displayNumberBorder	
	;call printing_squareBorder
	
	mov printStringColumn, 23			
	mov printStringRow, 14
	mov printStringColor, 0Eh
	lea SI, levelScoreMSG
	call printing_string
	
	mov displayNumCol, 52		
	mov displayNumRow, 14
	mov displayNumColor, 0Eh
	mov ax, score
	call Show_Two_Digit_Num	
	
	call slowdown_by_one_second			
	call slowdown_by_one_second
	call slowdown_by_one_second
	
	
	call drawing_grid
	cmp levelNumber, 3				
	je exitMain
	inc levelNumber
	mov ax, score
	add totalScore, ax			
	mov score, 0				
	mov moves, 15				
	jmp startGame
	
	pop ax
	ret

NextLevel endp 
;===========================================================================End of procedure======================================================================; 

;=========================================================================horizontal range procedure starts==============================================================;
horizontalrange proc

	push BX
	push AX
	push SI
		
	mov BX, 0
	mov AX, 0
	mov SI, 0
	
	mov rowIndexCrush, 0
	RowLoop:
		
		mov colIndexCrush, 0
		
		fullColLoop:
			cmp levelNumber, 2
			jne ColLoop
	
			cmp rowIndexCrush, 2				 
			jbe checkCornerColumns
			cmp rowIndexCrush, 7				
			jae checkCornerColumns
			cmp rowIndexCrush, 4				
			je checkCentreColumns	
			cmp rowIndexCrush, 5				
			je checkCentreColumns	
			jmp ColLoop
		
		checkCornerColumns:					 
			cmp colIndexCrush, 2
			jbe cont
			cmp colIndexCrush, 7
			jae cont
			jmp ColLoop
		
		checkCentreColumns:					
			cmp colIndexCrush, 3
			jb ColLoop
			cmp colIndexCrush, 6
			ja ColLoop
			jmp cont
			
		ColLoop:
			mov BL, rowIndexCrush
			mov AL, totalCols
			mul BL
			mov BX, AX
			mov DX, 0
			mov DL, colIndexCrush
			mov SI, DX
			
			call compressing_horizontally		
			
		cont:
			inc colIndexCrush
			cmp colIndexCrush, 10
			jb fullColLoop
		
		inc rowIndexCrush
		cmp rowIndexCrush, 10
		jb RowLoop
		
		call drawbackground
	pop SI
	pop AX
	pop BX
	
	ret		
horizontalrange endp
;===========================================================================End of procedure======================================================================;

;=================================================================compressing_horizontally procedure starts=======================================================;
compressing_horizontally proc
	mov di, SI
	cmp colIndexCrush, 8		
	jb checkCrush
	jmp exit

	checkCrush:
		push BX	
		add BX, SI
		mov startingIndex, BX		
		pop BX
		mov AL, arrayLvl[BX+SI]		
		cmp AL, 'B'						
		je exit							
		cmp AL, 'X'
		je exit
		
		inc SI
		cmp AL, arrayLvl[BX+SI]
		je checkNextValue		   
		jmp exit

	checkNextValue:
		inc SI
		cmp AL, arrayLvl[BX+SI]
		je fillZero					
		jmp exit

	fillZero:
		mov iscompressing_horizontally, 1	
		mov comboLength, 3			
		add score, 3
		
		cont:
			mov SI, di
			mov arrayLvl[BX+SI], 0
			inc SI
			mov arrayLvl[BX+SI], 0
			inc SI
			mov arrayLvl[BX+SI], 0
	
	crushAll:
		inc SI
		cmp SI, 10					
		jb upThreeCombo
		jmp endFN

	upThreeCombo:
		cmp AL, arrayLvl[BX+SI]	
		je placeBomb
		jmp endFN		
	
	placeBomb:							
		inc comboLength
		inc score
		mov arrayLvl[BX+SI-1], 0		
		mov arrayLvl[BX+SI], 'B'		
		jmp crushAll

	endFN:
		push BX
		add BX, SI
		dec BX
		mov endingIndex, BX	; Initializing var for removeBlockersHorizontally
		pop BX
		
		cmp levelNumber, 3
		jne exit
		call removeBlockersHorizontally	; If level 3, remove any blockers adjacent to the combination
		
		exit:
			call drawbackground
			mov SI, di
			ret

compressing_horizontally endp	
;===========================================================================End of procedure======================================================================;	

;=====================================================================verticalrange procedure starts==============================================================;
verticalrange proc
	push BX
	push AX
	push SI
	push DX
		
	mov BX, 0
	mov AX, 0
	mov SI, 0
	
	mov colIndexCrush, 0
	ColLoop:
		
		mov DX, 0
		mov DL, colIndexCrush
		mov SI, DX
		mov rowIndexCrush, 0
			
		fullRowLoop:
			cmp levelNumber, 2
			jne RowLoop
	
			cmp rowIndexCrush, 2				 
			jbe checkCornerColumns
			cmp rowIndexCrush, 7				
			jae checkCornerColumns
			cmp rowIndexCrush, 4				
			je checkCentreColumns	
			cmp rowIndexCrush, 5				
			je checkCentreColumns	
			jmp RowLoop
		
		checkCornerColumns:					 
			cmp colIndexCrush, 2
			jbe cont
			cmp colIndexCrush, 7
			jae cont
			jmp RowLoop
		
		checkCentreColumns:					
			cmp colIndexCrush, 3
			jb RowLoop
			cmp colIndexCrush, 6
			ja RowLoop
			jmp cont
		
		RowLoop:
			mov BL, rowIndexCrush
			mov AL, totalCols
			mul BL
			mov BX, AX
			call compressing_vertically		
			
		cont:	
			inc rowIndexCrush
			cmp rowIndexCrush, 10
			jb fullRowLoop
		
		inc colIndexCrush
		cmp colIndexCrush, 10
		jb ColLoop
		call drawbackground
	pop DX
	pop SI
	pop AX
	pop BX
	
	ret		
verticalrange endp
;===========================================================================End of procedure======================================================================;


;====================================================================compressing_vertically procedure starts======================================================;
compressing_vertically proc

	mov di, BX
	mov DL, rowIndexCrush
	mov tempVar, DL
	cmp rowIndexCrush, 8		
	jb checkCrush
	jmp exit

	checkCrush:
		push BX
		add BX, SI
		mov startingIndex, BX
		pop BX
		mov AL, arrayLvl[BX+SI]		
		cmp AL, 'B'						
		je exit
		cmp AL, 'X'
		je exit
		
		add BX, 10
		cmp AL, arrayLvl[BX+SI]
		je checkNextValue			
		jmp exit

	checkNextValue:
		add BX, 10
		cmp AL, arrayLvl[BX+SI]
		je fillZero					
		jmp exit

	fillZero:
		mov iscompressing_vertically, 1		
		mov comboLength, 3
		add score, 3
		
		cont:
			mov BX, di
			mov arrayLvl[BX+SI], 0
			inc tempVar
			add BX, 10
			mov arrayLvl[BX+SI], 0
			inc tempVar
			add BX, 10
			mov arrayLvl[BX+SI], 0

	crushAll:
		inc tempVar
		cmp tempVar, 10				
		jb upThreeCombo
		jmp endFN

	upThreeCombo:
		add BX, 10
		cmp AL, arrayLvl[BX+SI]
		je makeZero
		jmp endFN		
	
	makeZero:
		inc comboLength
		inc score
		mov arrayLvl[BX+SI-10], 0		
		mov arrayLvl[BX+SI], 'B'		
		jmp crushAll 

	endFN:
		push BX
		add BX, SI
		sub BX, 10
		mov endingIndex, BX	
		pop BX
		
		cmp levelNumber, 3
		jne exit
		call removing_upright_blocks
		
	exit:
		call drawbackground
		ret

compressing_vertically endp	
;===========================================================================End of procedure======================================================================;

;======================================================================bomb blast procedure starts================================================================;
blast_bomb proc
	
	; AL = Value to be bombed
	
	mov SI, 0
	mov CX, 100
	bombLoop:
		cmp AL, arrayLvl[SI]		
		je makeZero
		cmp arrayLvl[SI], 'B'	
		
		je makeZero
		jmp checkNext		
	
	makeZero:
		mov arrayLvl[SI], 0
		
		
	checkNext:
		inc SI
		loop bombLoop
	
	mov isAbomb, 1	
	mov numberOfBomb, AL
	ret
blast_bomb endp 
;===========================================================================End of procedure======================================================================;

;=========================================================================placing numbers procedure starts==============================================================;
place_numbers proc
pushing	
	mov AX, 0
	mov DX, 0
	
	mov dropRow, 0
	RowLoop:
		
		mov dropCol, 0
		ColLoop:
			
			mov BL, dropRow
			mov AL, totalCols
			mul BL
			mov BX, AX
			mov DX, 0
			mov DL, dropCol
			mov SI, DX
			cmp arrayLvl[BX+SI], 0
			je callmoveUp
			jmp checkNext
			
			callMoveUp:
				call moveUp
			
			checkNext:
				inc dropCol
				cmp dropCol, 10
				jb ColLoop
			
			inc dropRow
			cmp dropRow, 10
			jb RowLoop
	popping	
	ret
place_numbers endp
;===========================================================================End of procedure======================================================================;

;=========================================================================checkswap procedure starts==============================================================;
moveUp proc
	mov temp, 0
	mov DL, dropRow
	mov tempRow, DL
	
	upLoop:	
		cmp tempRow, 0		
		je getRand
		
		cmp arrayLvl[BX+SI-10], 7		
		je getRand
		
		cmp arrayLvl[BX+SI-10], 'X'	
		je checkifXIsAtTopRow
 
		mov DL, arrayLvl[BX+SI]     
		mov DH, arrayLvl[BX+SI-10]
		mov arrayLvl[BX+SI], DH		
		mov arrayLvl[BX+SI-10], DL
		dec tempRow
		
	KeepMovingUp:
		mov BX, 0
		mov AX, 0
		mov BL, tempRow
		mov AL, totalCols
		mul BL
		mov BX, AX
		
		jmp upLoop
	
	checkifXIsAtTopRow:
		mov DL, tempRow
		mov temp, DL
		dec temp		
		cmp temp, 0 					
		je getRand	
		mov DL, arrayLvl[BX+SI]     	
		mov DH, arrayLvl[BX+SI-20]  	
		mov arrayLvl[BX+SI], DH		
		mov arrayLvl[BX+SI-20], DL
		sub tempRow, 2  					
		jmp KeepMovingUp
	
	getRand:
		mov rangeOfRandom, 5
		call create_random_number
		push DX
		mov DL, randomNumber
		mov arrayLvl[BX+SI], DL
		pop DX
		
	ret
moveUp endp
;===========================================================================End of procedure======================================================================;

;==================================================================crushing constantly procedure starts===========================================================;
constant_crushing proc
	
	continuousCrush:
		call horizontalrange	
		call verticalrange
		
		cmp iscompressing_horizontally, 1	
		je crushAgain
		cmp iscompressing_vertically, 1		
		je crushAgain
		jmp finish					
		
		crushAgain:
			mov squareClr, 9		
			call show_rules
			call printing_level				
			
			call place_numbers			
			call printing_level				
		
			mov iscompressing_horizontally, 0
			mov iscompressing_vertically, 0
			jmp continuousCrush			

		finish:
			mov squareClr, 9		
			call show_rules
			call printing_level	
			call drawbackground
			ret	
constant_crushing endp
;===========================================================================End of procedure======================================================================;

;==============================================================removing horizontal blocks procedure starts========================================================;
removeBlockersHorizontally proc	
	mov AX, startingIndex
	mov BH, 10
	div BH				
	cmp AH, 0			
	jne startMiddle		
	
		
		mov SI, startingIndex
		cmp SI, 9
		jna inFirstRow_First	; If in first row, only check the tile below
		
		cmp SI, 90				
		jae inLastRow_First
		call up
		call down
		jmp middleTiles_First
		
		inFirstRow_First:		
			call down
			jmp middleTiles_First
			
		inLastRow_First:
			call up
		
		middleTiles_First:	
		xor CX, CX
		mov CL, comboLength 
		sub CL, 2
		inc SI
		
		checkBlockerLoop_First:
			cmp startingIndex, 9	
			jna onlyBelow_First
			
			cmp SI, 90
			jae onlyAbove_First
			call up
			call down
			jmp nextLoopIter_First
			
			onlyAbove_First:
				call up
				jmp nextLoopIter_First
			
			onlyBelow_First:			
				call down
				
			nextLoopIter_First:
			inc SI
			loop checkBlockerLoop_First
		
		jmp checkLastTile
	
	
	startMiddle:
		mov SI, startingIndex
		cmp SI, 9
		jna inFirstRow_Middle	
		
		cmp SI, 90				
		jae inLastRow_Middle
		call up
		call down
		call left
		jmp middleTiles_Middle
		
		inFirstRow_Middle:		
			call down
			call left
			jmp middleTiles_Middle
			
		inLastRow_Middle:
			call up
			call left
			
		middleTiles_Middle:	
		xor CX, CX
		mov CL, comboLength
		sub CL, 2
		inc SI
		
		checkBlockerLoop_Middle:
			cmp startingIndex, 9	
			jna onlyBelow_Middle
			
			cmp SI, 90
			jae onlyAbove_Middle
			call up
			call down
			call left
			jmp nextLoopIter_Middle
			
			onlyAbove_Middle:
				call up
				call left
				jmp nextLoopIter_Middle
			
			onlyBelow_Middle:			
				call down
				call left
				
			nextLoopIter_Middle:
			inc SI
			loop checkBlockerLoop_Middle
			
	checkLastTile:
		mov SI, endingIndex
		call indexOfLastColumn
		xor DX, DX
		mov DL, lastColIndex	
		
		cmp SI, 9
		jna	inFirstRow_Last
		
		cmp SI, 90
		jae inLastRow_Last
		
		cmp endingIndex, DX
		je inLastColC
		
		call up
		call down
		call right
		ret
		
		inLastColC:
			call up
			call down
			ret
	
		inFirstRow_Last:
			cmp endingIndex, DX
			je inLastColA
			
			call down
			call right
			ret
			
			inLastColA:
				call down
				ret
		
		inLastRow_Last:
			cmp endingIndex, DX
			je inLastColB
			
			call up
			call right
			ret
			
		inLastColB:
			call up
			call drawbackground

	ret	
removeBlockersHorizontally endp
;===========================================================================End of procedure======================================================================;

;=========================================================================checking down procedure starts==============================================================;
down proc

	cmp arrayLvl[SI + 10], 'X'
	jne exit
	mov arrayLvl[SI + 10], 0

	exit:
		ret
down endp
;===========================================================================End of procedure======================================================================;


;=========================================================================checking up procedure starts==============================================================;
up proc
	cmp arrayLvl[SI - 10], 'X'
	jne exit
	mov arrayLvl[SI - 10], 0

	exit:
		ret
up endp
;===========================================================================End of procedure======================================================================;

;====================================================================checking left procedure starts===============================================================;
left proc
	cmp arrayLvl[SI - 1], 'X'
	jne exit
	mov arrayLvl[SI - 1], 0

	exit:
		ret
left endp
;===========================================================================End of procedure======================================================================;


;=======================================================================check right procedure starts==============================================================;
right proc
	cmp arrayLvl[SI + 1], 'X'
	jne exit
	mov arrayLvl[SI + 1], 0

	exit:
		ret
right endp
;===========================================================================End of procedure======================================================================;

;==================================================================index of last column procedure starts==========================================================;
indexOfLastColumn proc
	push AX
	push BX

	mov AX, SI
	mov BH, 10
	div BH
	
	mov AH, 0
	mul BH
	add AL, 9
	
	mov lastColIndex, AL
	
	pop BX
	pop AX
	ret
indexOfLastColumn endp
;===========================================================================End of procedure======================================================================;

;===============================================================removing upright blocks procedure starts==========================================================;
removing_upright_blocks proc	
	cmp startingIndex, 9	
	ja startMiddle			
	

		mov SI, startingIndex
		cmp SI, 0
		je inFirstCol_First		
		cmp SI, 9				
		je inLastCol_First
		call right
		call left
		jmp middleTiles_First
		
		inFirstCol_First:		
			call right
			jmp middleTiles_First
			
		inLastCol_First:
			call left
		
		middleTiles_First:	
		xor CX, CX
		mov CL, comboLength 
		sub CL, 2
		add SI, 10
		
		checkBlockerLoop_First:
			cmp startingIndex, 0	
			je onlyRight_First
			cmp SI, 9
			je onlyLeft_First
			call right
			call left
			jmp nextLoopIter_First
			
			onlyLeft_First:
				call left
				jmp nextLoopIter_First
			
			onlyRight_First:			
				call right
				
			nextLoopIter_First:
			add SI, 10
			loop checkBlockerLoop_First
		
		jmp checkLastTile
	
	
	startMiddle:
		mov SI, startingIndex
		mov AX, SI				
		mov BH, 10
		div BH
		cmp AH, 0
		je inFirstCol_Middle	
		
		call indexOfLastColumn
		xor DX, DX
		mov DL, lastColIndex	
		cmp SI, DX				
		je inLastCol_Middle		
		
		call up			
		call right
		call left
		jmp middleTiles_Middle
		
		inFirstCol_Middle:		
			call up
			call right
			jmp middleTiles_Middle
			
		inLastCol_Middle:
			call up
			call left
			
		middleTiles_Middle:	
		xor CX, CX
		mov CL, comboLength
		sub CL, 2
		add SI, 10
		
		checkBlockerLoop_Middle:
			mov AX, startingIndex					
			mov BH, 10
			div BH
			cmp AH, 0			
			je right_Middle	
			
			call indexOfLastColumn
			xor DX, DX
			mov DL, lastColIndex	
			cmp SI, DX				
			je left_Middle		
			
			call left
			call right
			jmp nextLoopIter_Middle
			
			left_Middle:
				call left
				jmp nextLoopIter_Middle
			
			right_Middle:			
				call right
				
			nextLoopIter_Middle:
			add SI, 10
			loop checkBlockerLoop_Middle
			
	checkLastTile:
		mov SI, endingIndex
		mov AX, SI				
		mov BH, 10
		div BH
		cmp AH, 0
		je inFirstCol_Last	
		
		call indexOfLastColumn
		xor DX, DX
		mov DL, lastColIndex	
		cmp SI, DX				
		je inLastCol_Last	
		
		cmp SI, 90
		ja inMiddleColLastRow
		call down		
		call right
		call left
		ret
		
		inMiddleColLastRow:
			call right
			call left
			ret
		
		inFirstCol_Last:
			cmp SI, 90
			je blockNumber90
			call right
			call down
			ret
			
			blockNumber90:
				call right
				ret
		
		inLastCol_Last:
			cmp SI, 99
			je blockNumber99
			call left
			call down
			ret
			
			blockNumber99:
				call left
				call drawbackground
	ret	
removing_upright_blocks endp
;===========================================================================End of procedure======================================================================;

;======================================================Procedure For Displaying Two or Three Digit Number starts==================================================;
Show_Two_Digit_Num proc
	push DX
	push CX
	mov displayNumCount, 0 
	mov BL, 10
	
	pushingNumberIntoStack:
		div BL
		mov remainder, AH
		mov quotient, AL
		mov AH, 0
		mov AL, remainder
		push AX					
		inc displayNumCount
		mov AL, quotient		
		mov AH, 0
		cmp AL, 0				
		jne pushingNumberIntoStack
		mov DH, displayNumRow
		mov DL, displayNumCol
		
		popingAndPrintingNumber:
		pop AX
		mov remainder, AL 	
		add remainder, 48
		mov AH, 02			
		int 10h
		
		mov AH, 09
		mov AL, remainder
		mov BL, displayNumColor
		mov CX, 1
		mov BH, 0
		int 10h
		
		inc DL					
		dec displayNumCount
		cmp displayNumCount, 0
		ja popingAndPrintingNumber
		call drawbackground
	pop CX
	pop DX
	ret
Show_Two_Digit_Num endp	
;===========================================================================End of procedure======================================================================;

;=========================================================================Interface procedure starts==============================================================;
interface proc

;==========this procedure will show us the message on the screen when the game starts================================================; 
	
push ax

	mov ah, 0		; Set video mode 640x480
	mov al, 12h
	int 10h
	
	;call displayNumberBorder	
	;call printing_squareBorder
	call showing_name_entered
	call PlayerInfo
	call show_level
	call choose_level
	
	pop ax
	ret
interface endp
;===========================================================================End of procedure======================================================================;

;===============================================================procedure for showing the game has ended starts===================================================;
End_Message proc
	push ax
	mov ah, 0		; Set video mode 640x480
	mov al, 12h
	int 10h
	
	;call displayNumberBorder	
	;call printing_squareBorder
	
	mov printStringColumn, 27			
	mov printStringRow, 13
	mov printStringColor, 0Eh
	lea SI, thankYouMSG
	call printing_string 
	
	mov printStringRow, 14			
	mov printStringColumn, 26
	mov printStringColor, 0Eh
	lea SI, endScoreMSG
	call printing_string
	
	mov displayNumCol, 46		
	mov displayNumRow, 14
	mov displayNumColor, 0Eh
	add ax, score
	mov ax, totalScore
	
	call Show_Two_Digit_Num
	jmp exitMain
	
	pop ax
	ret
End_Message endp
;===========================================================================End of procedure======================================================================;

;================================================================procedure for asking the level starts============================================================;
choose_level proc

;==================this procedure will ask the level at which the user wants to play==============================================================================;


pushing	

	mov dl, 33
	mov dh, 14
	mov ah, 02
	int 10h
	
	mov ah, 01
	int 21h
	sub al, 48
	mov levelNumber, al
	
	popping
	ret	
choose_level endp
;===========================================================================End of procedure======================================================================;

;================================================================procedure for showing level entered starts=======================================================;
show_level proc

pushing	
	;call blue_back

	mov dh, 14
	mov dl, 13
	mov si, 0
	printingEnterLevel:
		mov ah, 02
		int 10h
		mov ah, 09 
		mov al, enterLevelMSG[si]
		mov bl, 6         ; color of string 
		mov cx, 1
		mov bh, 0
		int 10h	
		inc dl
		inc si
		cmp enterLevelMSG[si], "$"
		jne printingEnterLevel	
		call drawbackground
	popping
	ret

show_level endp
;===========================================================================End of procedure======================================================================;

;=========================================================================Player name procedure starts============================================================;
PlayerInfo proc
pushing	
	mov dl, 30     
	mov dh, 13
	mov ah, 02
	int 10h
		
	lea SI, playerName 
	mov ah, 01h

	inputChar:

		int 21h
		mov [si], al
		inc si
		cmp al, 13
		jne inputChar
		popping
	ret	
PlayerInfo endp
;===========================================================================End of procedure======================================================================;

;=================================================================displaying name entered procedure starts========================================================;
showing_name_entered proc
	push dx
	push ax
	push si
	push cx
	push bx
	
	call blue_back

	mov dh, 13
	mov dl, 13
	mov si, 0
	
	printingEnterName:
		mov ah, 02
		int 10h
		
		mov ah, 09 
		mov al, enterNameMSG[si]
		mov bl, 6
		mov cx, 1
		mov bh, 0
		int 10h	
		
		inc dl
		inc si
		cmp enterNameMSG[si], "$"
		jne printingEnterName 	
	
	
	pop bx
	pop cx
	pop si
	pop ax
	pop dx
	
	ret
showing_name_entered endp
;===========================================================================End of procedure======================================================================;

;=========================================================================checkswap procedure starts==============================================================;
printPlayerName proc

pushing	

	mov dh, 0
	mov dl, 6
	mov si, 0
	
	printingName:

		mov ah, 02
		int 10h
		mov ah, 09 
		mov al, playerName[si]
		mov bl, 5   ; color 
		mov cx, 1   ; x axis
		mov bh, 0   ; ya xis
		int 10h	
		
		inc dl         
		inc si
		cmp playerName[si], 13
		jne printingName

	popping
	
	ret
printPlayerName endp
;===========================================================================End of procedure======================================================================;

;==============================================================printing numbers horizontally procedure starts=====================================================;
printing_random_numbers_horizontally proc
	
	push dx

	mov rangeOfRandom, 6	  
	mov cx, 80
	mov DL, 0			  
	print:
		mov AH, 02h		
		int 10h
		
		call create_random_number
		mov AL, randomNumber   		    
		add AL, 48			 	
		mov BH, 0		 	 	
		mov BL, color	     	
		push cx
		mov CX, 1		  		
		mov AH, 9h				
		int 10h    
		pop cx
		inc dl
		inc color
		loop print
		
	pop dx	
	ret	
printing_random_numbers_horizontally endp
;===========================================================================End of procedure======================================================================;

;==============================================================printing numbers vertically procedure starts=======================================================;
printing_random_numbers_vertically proc
	push dx

	mov rangeOfRandom, 6	  
	mov cx, 16
	mov DH, 7			 
	print:
		mov AH, 02h		  
		int 10h
		
		call create_random_number
		mov AL, randomNumber   		    
		add AL, 48			 	
		mov BH, 0		 	 	
		mov BL, color	     	
		push cx
		mov CX, 1		  			
		mov AH, 9h				
		int 10h    
		pop cx
		inc dh
		inc color
		loop print
		call drawbackground
	pop dx	
	ret	
printing_random_numbers_vertically endp
;===========================================================================End of procedure======================================================================;


end
