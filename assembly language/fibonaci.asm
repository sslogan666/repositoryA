include vcIO.inc
.data
	frm0	byte	"%d ",0
	frm1	byte	10
.code
	main proc
	mov ecx,18
	mov ebx,1
	mov eax,ebx
	pushad
	invoke printf,offset frm0,eax
	invoke printf,offset frm0,ebx
	popad
lab1:
	add ebx,eax
	xchg eax,ebx
	pushad
	invoke printf,offset frm0,eax
	popad
	loop lab1
	ret
	main endp
	end main