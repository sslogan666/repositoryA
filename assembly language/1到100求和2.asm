include vcIO.inc
.data
	frm1	byte	"sum=%d",10,0
.code
	main proc
		xor eax,eax	;累加和，初始化为0
		mov ecx,1	;当前要处理的数字
		again:
			cmp ecx,101	
			jz l1	;循环到101次跳出循环
			add eax,ecx	;将当前数字累加到eax
			inc ecx		;ecx--
			jmp again	;继续循环
		l1:
			pushad
			invoke printf,offset frm1,eax
			popad
			ret
	main endp
	end main