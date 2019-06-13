include vcIO.inc
.data
	msg		byte	"Ejk i ",0
	space	byte	0
	lowercase	byte	0
	frm0	byte	"space=%d lower=%d",10,0
.code
	main proc
	mov ecx,(lengthof msg)-1
	mov esi,offset msg
	xor ebx,ebx
lab0:
	cmp byte ptr[esi+ebx],' '
	jnz lab1
	inc space
	jmp lab2
lab1:
	cmp byte ptr[esi+ebx],'a'
	jb lab2
	cmp byte ptr[esi+ebx],'z'
	ja lab2
	inc lowercase
lab2:
	inc ebx
	loop lab0
	pushad
	invoke printf,offset frm0,space,lowercase
	popad
	ret
	main endp
	end main