include vcIO.inc
.data
	frm0	byte	"%d ",0
.code
	main proc
	xor ecx,ecx
	mov ecx,-100
lab0:
	mov eax,ecx
	pushad
	invoke printf,offset frm0,ecx
	popad
	loop lab0
	ret
	main endp
	end main