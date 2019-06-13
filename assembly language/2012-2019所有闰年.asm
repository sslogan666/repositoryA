include vcIO.inc
.data
	Lyear	dword	100 dup(?)
	four	word	4
	hun		word	100
	fo		word	400
	star	dword	2012
	en		dword	2099
	frm0	byte	"%d ",0
.code
	main proc
	mov ecx,star
	xor esi,esi
lab0:
	cmp ecx,en
	ja lab6
lab1:
	mov eax,ecx
	xor edx,edx
	mov bx,four
	div bx
	cmp dx,0
	jnz lab3
lab2:
	mov eax,ecx
	xor edx,edx
	div hun
	cmp dx,0
	jnz lab4
lab3:
	mov eax,ecx
	xor edx,edx
	div fo
	cmp dx,0
	jnz lab5
lab4:
	mov Lyear[esi*4],ecx
	inc esi
lab5:
	inc ecx
	jmp lab0
lab6:
	mov ecx,esi
	xor ebx,ebx
lab7:	
	pushad
	invoke printf,offset frm0,Lyear[ebx*4]
	popad
	inc ebx
	loop lab7
	ret
	main endp
	end main