include vcIO.inc
.data
	regd	byte	'EAX=',8 dup(0),'H',0
.code
main proc
	mov eax,1234abcdh
	xor ebx,ebx
	mov ecx,8
again:
	rol eax,4
	push eax
	call htoasc
	mov regd+4[ebx],al
	pop eax
	inc ebx
	dec ecx
	jnz again
	mov eax,offset regd
	call dispmsg
ret
main endp

htoasc proc
	and eax,0fh
	mov al,ASCII[eax]
ret
ASCII	byte	'0123456789ABCDEF' 
htoasc endp

dispmsg proc
	invoke printf,eax
ret
dispmsg endp
end main