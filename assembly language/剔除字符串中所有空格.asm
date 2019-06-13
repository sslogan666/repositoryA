include vcIO.inc
.data
	msg		byte	"d g 7 8",0
	frm0	byte	"%s",0
.code
	main proc
	mov edi,(lengthof msg)-2	;tailp
	mov esi,edi					;scanp
lab0:
	cmp esi,0
	jl lab
	cmp msg[esi],' '
	jnz lab1
	mov ebx,esi
	inc ebx
lab2:
	cmp ebx,edi
	ja lab3
	mov al,msg[ebx]
	mov msg[ebx-1],al
	inc ebx
	jmp lab2
lab3:
	mov msg[edi],0
	dec edi
lab1:
	dec esi
	jmp lab0
lab:
	pushad
	invoke printf,offset frm0,offset msg
	popad
	ret
	main endp
	end main