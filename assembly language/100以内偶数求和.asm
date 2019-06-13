include vcIO.inc
.data
	frm1 byte "sum=%d",10,0	;输出格式描述串
.code
	main proc
		mov ecx,100	;用于指定循环次数，也是当前要处理的数字
		mov eax,0	;偶数的和，初始化为0
	l1:	
		test ecx,1	;ecx为当前要处理的数字，将ecx和1做与运算，并改变标志位，ecx并不改变
		jnz l2		;如果与的结果不为0，说明此树不是偶数，跳转到l2
		add eax,ecx	;如果与的结果为0，说明此树是偶数，二进制最后一位为0，则此数是偶数
	l2:	loop l1		;ecx=ecx-1，如果ecx！=0,则跳转到l1
		pushad
		invoke printf, offset frm1,eax	;输出偶数之和
		popad
	main endp
	end main