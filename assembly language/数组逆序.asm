include vcIO.inc
.data
	array dword 12,4,168,122,-33,56,78,99,345,66,-5
	frm0	byte	"%d ",0
.code
	main proc
	mov ecx,lengthof array
	shr ecx,1
	xor ebx,ebx
	mov eax,(lengthof array)-1
lab2:
	mov edx,array[ebx*4]
	xchg edx,array[eax*4]
	mov array[ebx*4],edx
	inc ebx
	dec eax
	loop lab2
		
	mov ecx,lengthof array
	xor ebx,ebx
lab3:
	pushad
	invoke printf,offset frm0,array[ebx*4]
	popad
	inc ebx
	loop lab3
	ret
	main endp
	end main