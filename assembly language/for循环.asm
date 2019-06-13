include	vcIO.inc
.data
	sum		dword	0	;1到100内偶数的和
	i		dword	1	;循环变量,同时也是当前要处理的数字
	frm1	byte	"sum=%d",10,0	;结果格式化串
.code
	main proc
		xor ebx,ebx		;当前所有偶数的和，初始化为0
		mov cx,2
	l1:
		cmp i,101		
		jz done			;循环到101次，跳出循环
		mov eax,i		;除数i的最大值为100，放到ax即可
		xor edx,edx		;dx置0
		div cx			;dx.ax除以2
		cmp dx,0		;判断余数dx是否为0
		jnz l2			;余数不为0，不是偶数，跳转到l2
		add ebx,i		;是偶数则累加到ebx
	l2:	
		inc i			;i++
		jmp l1			;继续循环
	done:
		mov sum,ebx		;将偶数和放入sum
		pushad
		invoke printf,offset frm1,sum	;输出sum
		popad
		ret
	main endp
	end main