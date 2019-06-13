include vcIO.inc
.data
	frm0	byte	"%d ",0
.code
	main proc
	mov ecx,10
	mov ebx,10
lab0:
	cmp ecx,10000
	ja labend
	mov eax,ecx
	xor esi,esi
lab1:
	cmp eax,0
	jz lab2
	xor edx,edx
	div ebx
	imul esi,ebx
	add esi,edx
	jmp lab1
lab2:
	cmp ecx,esi
	jnz lab3
	pushad
	invoke printf,offset frm0,esi
	popad
lab3:
	inc ecx
	jmp lab0
labend:
	ret
	main endp
	end main