include vcIO.inc
.data
	frm1	byte	'%d',0
	num		dword	81,162,63
.code
main proc
	push num
	push [num+4]
	call hua
	add esp,4
	push [num+8]
	call hua
	add esp,4
	pop eax
	invoke printf,offset frm1,eax	
	ret
main endp

hua proc
	push ebp
	mov ebp,esp
	xor edx,edx
	mov eax,[ebp+12]
	mov ecx,[ebp+8]
lab1:
	cmp ecx,0
	jz lab2
	div ecx
	mov eax,ecx
	mov ecx,edx
	xor edx,edx
	jmp lab1
lab2:
	mov [ebp+12],eax
	pop ebp
	ret
hua endp
end main