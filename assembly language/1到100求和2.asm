include vcIO.inc
.data
	frm1	byte	"sum=%d",10,0
.code
	main proc
		xor eax,eax	;�ۼӺͣ���ʼ��Ϊ0
		mov ecx,1	;��ǰҪ���������
		again:
			cmp ecx,101	
			jz l1	;ѭ����101������ѭ��
			add eax,ecx	;����ǰ�����ۼӵ�eax
			inc ecx		;ecx--
			jmp again	;����ѭ��
		l1:
			pushad
			invoke printf,offset frm1,eax
			popad
			ret
	main endp
	end main