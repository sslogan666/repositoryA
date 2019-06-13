include vcIO.inc
.data
	frm0	byte	"%d ",0
	frm1	byte	10,"素数的个数=%d",0
	starta	dword	2			;起始值
	enda	dword	100			;终止值
	halfi	dword	?
	prime	dword	(enda-starta+1) dup(?)
.code
	main proc
	xor esi,esi
	mov ebx,starta
lab2:
	cmp ebx,enda
	ja lab0
	mov halfi,ebx
	shr halfi,1
	mov ecx,starta
lab4:
	cmp ecx,halfi
	ja lab1
	mov eax,ebx
	xor edx,edx
	div ecx
	cmp edx,0
	jz lab3
	inc ecx
	jmp lab4
lab1:
	mov prime[esi*4],ebx
	inc esi
lab3:
	inc ebx
	jmp lab2
lab0:
	xor ecx,ecx
lab5:
	cmp ecx,esi
	jae lab6
	pushad
	invoke printf,offset frm0,prime[ecx*4]
	popad
	inc ecx
	jmp lab5
lab6:
	pushad
	invoke printf,offset frm1,esi
	popad
	ret
	main endp
	end main