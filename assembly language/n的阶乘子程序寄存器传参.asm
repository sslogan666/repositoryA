include vcIO.inc
.data
	frm0	byte	'%d',0
.code
main proc
	mov ecx,8
	xor eax,eax
	xor ebx,ebx
lab0:
	mov ebx,ecx
	call fa1
	add eax,ebx
	loop lab0
	invoke printf,offset frm0,eax
	ret
main endp

fa1 proc
	push ecx
	mov ecx,ebx
	mov ebx,1
lab1:
	imul ebx,ecx
	loop lab1
	pop ecx
	ret
fa1 endp

end main