include vcIO.inc
.data
	frm1	byte	"sum=%d",10,0
.code
	main proc
		xor eax,eax	;�ۼӺͣ���ʼ��Ϊ0
		mov ecx,1	;��ǰҪ��������֣���ʼ��Ϊ1
		again:
			add eax,ecx	;�Ƚ����ۼ�
			inc ecx		;ecx++
			cmp ecx,101	
			jz l1		;ѭ����101��ʱ������ѭ��
			jmp again	;�������ѭ��
		l1:
			pushad
			invoke printf,offset frm1,eax
			popad
		ret
	main endp
	end main