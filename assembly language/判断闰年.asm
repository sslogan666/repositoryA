include vcIO.inc
.data
	year	dword	?
	frm		byte	"%d",0
	frm1	byte	"Is leap year.",10,0
	frm2	byte	"Is not leap year.",10,0
	frm3	byte	"%s",0	
.code
	main proc
		pushad
		invoke scanf,offset frm,offset year	;输入年份
		popad
		mov ebx,year

		mov eax,ebx	;将年份放在eax低16位ax
		xor edx,edx	
		mov cx,4	
		div cx		;将年份dx.ax除以4
		cmp dx,0	;比较余数dx是否为0
		jnz l0		;不为0则跳转到l0，为0则继续向下执行

		mov eax,ebx
		xor edx,edx
		mov cx,100	
		div cx		;将年份dx.ax除以100
		test dx,dx	;比较余数dx是否为0
		jnz l1		;不为0则跳转到l1,为0则继续向下执行
	l0:
		mov eax,ebx
		xor edx,edx
		mov cx,400	
		div cx		;将年份dx.ax除以400
		test dx,dx	;比较余数dx是否为0
		jnz l2		;不为0则跳转到l2,为0则继续向下执行
	l1:
		pushad
		invoke printf,offset frm3,offset frm1
		popad
		jmp done
	l2:
		pushad
		invoke printf,offset frm3,offset frm2
		popad
	done:
		ret
	main endp
	end main