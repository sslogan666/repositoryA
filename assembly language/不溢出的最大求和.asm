include vcIO.inc
.data
	frm1	byte	"sum_max=%d",10,0
	frm2	byte	"n_max=%d",10,0
.code
	main proc
		xor eax,eax	;累加和，初始化为0
		mov ecx,0	;当前要处理的数字，初始化为0
		again:
			inc ecx	;ecx++
			add eax,ecx	;进行累加
			jno again	;判断是否溢出，没有溢出则继续循环
			sub eax,ecx	;若有溢出则累加和减去加的最后一个数字
			dec ecx		;减去ecx多加的1
			pushad
			invoke printf,offset frm1,eax	;输出不溢出情况下，最大的累加和
			popad
			pushad
			invoke printf,offset frm2,ecx	;输出对应的n
			popad
	main endp
	end main