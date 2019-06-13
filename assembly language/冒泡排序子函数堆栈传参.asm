include vcIO.inc
.data
	array	dword	43,56,23,78,58
	frm1	byte	'%d ',0
.code
main proc
	push (lengthof array)-1
	push offset array
	call bubble
	xor ebx,ebx
	mov ecx,lengthof array
lab1:
	pushad
	invoke printf,offset frm1,array[ebx*4]
	popad
	inc ebx
	loop lab1
	add esp,8
	ret
main endp

bubble proc
	push ebp
	mov ebp,esp
	mov ecx,[ebp+12]
lab4:
	cmp ecx,0
	jz lab2
	mov esi,[ebp+8]
	mov ebx,ecx
lab3:
	cmp ebx,0
	jz lab5
	mov eax,[esi]
	cmp eax,[esi+4]
	jng	lab6
	xchg eax,[esi+4]
	mov [esi],eax
lab6:
	add esi,4
	dec ebx
	jmp lab3
lab5:
	dec ecx
	jmp lab4
lab2:
	pop ebp
	ret
bubble endp

end main