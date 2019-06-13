include vcIO.inc
.data
	frm1	byte	'%d',0
.code
	main proc
	xor eax,eax
	xor ebx,ebx
	mov ecx,8
lab1:
	push ecx
	call fa3
	pop ebx
	add eax,ebx
	loop lab1
	invoke printf,offset frm1,eax
	main endp

	fa3 proc
	push ecx
	push ebp
	mov ebp,esp
	mov ebx,1
	mov ecx,[ebp+12]
lab2:
	imul ebx,ecx
	loop lab2
	mov [ebp+12],ebx
	pop ebp
	pop ecx
	ret
	fa3 endp

	end main