include vcIO.inc
.data
	n	dword	?
	frm0	byte	'%d',0
.code
	main proc
	xor eax,eax
	xor ebx,ebx
	mov ecx,8
lab1:
	mov n,ecx
	call fa2
	add eax,ebx
	loop lab1
	invoke printf,offset frm0,eax
	ret
	main endp

	fa2 proc
	push ecx
	mov ecx,n
	mov ebx,1
lab2:
	imul ebx,ecx
	loop lab2
	pop ecx
	ret
	fa2 endp

	end main
