include vcIO.inc
.data
	prime	dword	100 dup(?)
	halfofi	dword	?
	frm0	byte	"%d ",0
	frm1	byte	"¸öÊý=%d",0
.code
	main proc
	xor esi,esi
	mov ebx,2
lab0:
	mov halfofi,ebx
	shr halfofi,1
	cmp ebx,100
	ja labend
	mov eax,ebx
	mov ecx,2
lab1:
	mov eax,ebx
	cmp ecx,halfofi
	ja lab2
	xor edx,edx
	div ecx
	cmp edx,0
	jz lab3
	inc ecx
	jmp lab1
lab2:
	mov prime[esi*4],ebx
	inc esi
lab3:
	inc ebx
	jmp lab0
labend:
	mov ecx,esi
labp:
	pushad
	invoke printf,offset frm0,prime[ecx*4-4]
	popad
	loop labp
	pushad
	invoke printf,offset frm1,esi
	popad
	ret
	main endp
	end main