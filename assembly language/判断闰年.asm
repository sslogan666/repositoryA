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
		invoke scanf,offset frm,offset year	;�������
		popad
		mov ebx,year

		mov eax,ebx	;����ݷ���eax��16λax
		xor edx,edx	
		mov cx,4	
		div cx		;�����dx.ax����4
		cmp dx,0	;�Ƚ�����dx�Ƿ�Ϊ0
		jnz l0		;��Ϊ0����ת��l0��Ϊ0���������ִ��

		mov eax,ebx
		xor edx,edx
		mov cx,100	
		div cx		;�����dx.ax����100
		test dx,dx	;�Ƚ�����dx�Ƿ�Ϊ0
		jnz l1		;��Ϊ0����ת��l1,Ϊ0���������ִ��
	l0:
		mov eax,ebx
		xor edx,edx
		mov cx,400	
		div cx		;�����dx.ax����400
		test dx,dx	;�Ƚ�����dx�Ƿ�Ϊ0
		jnz l2		;��Ϊ0����ת��l2,Ϊ0���������ִ��
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