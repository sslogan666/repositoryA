include vcIO.inc
.data
	frm1	byte	"sum=%d",10,0
.code
	main proc
		xor eax,eax	;累加和，初始化为0
		mov ecx,1	;当前要处理的数字，初始化为1
		again:
			add eax,ecx	;先进行累加
			inc ecx		;ecx++
			cmp ecx,101	
			jz l1		;循环到101次时，跳出循环
			jmp again	;否则继续循环
		l1:
			pushad
			invoke printf,offset frm1,eax
			popad
		ret
	main endp
	end main