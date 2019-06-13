include vcIO.inc
.data
	frm0	byte	"%d ",0
	frm1	byte	10
.code
	main proc
	mov ecx,2
	mov ebx,1
	mov eax,1
	lab1:
		add eax,ebx
		jo lab2
		xchg eax,ebx
		inc ecx
		jmp lab1
	lab2:
		pushad
		invoke printf,offset frm0,ebx
		popad
		pushad
		invoke printf,offset frm0,ecx
		popad
		ret
	main endp
	end main