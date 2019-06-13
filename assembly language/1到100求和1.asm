include vcIO.inc
.data
	frm1	byte	"sum=%d",10,0
.code
	main proc
		mov ecx,100
		xor eax,eax
	again:
		add eax,ecx
		loop again
		pushad
		invoke printf,offset frm1,eax
		popad
	main endp
	end main