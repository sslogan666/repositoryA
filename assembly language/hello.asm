include vcIO.inc

.data
     Hello byte "hello, gensokyo",10, 0

.code
 main proc
   pushad
	invoke printf, offset Hello
	invoke _getch
   popad
	ret
	
 main endp
 end main