include	vcIO.inc
.data
	sum		dword	0	;1��100��ż���ĺ�
	i		dword	1	;ѭ������,ͬʱҲ�ǵ�ǰҪ���������
	frm1	byte	"sum=%d",10,0	;�����ʽ����
.code
	main proc
		xor ebx,ebx		;��ǰ����ż���ĺͣ���ʼ��Ϊ0
		mov cx,2
	l1:
		cmp i,101		
		jz done			;ѭ����101�Σ�����ѭ��
		mov eax,i		;����i�����ֵΪ100���ŵ�ax����
		xor edx,edx		;dx��0
		div cx			;dx.ax����2
		cmp dx,0		;�ж�����dx�Ƿ�Ϊ0
		jnz l2			;������Ϊ0������ż������ת��l2
		add ebx,i		;��ż�����ۼӵ�ebx
	l2:	
		inc i			;i++
		jmp l1			;����ѭ��
	done:
		mov sum,ebx		;��ż���ͷ���sum
		pushad
		invoke printf,offset frm1,sum	;���sum
		popad
		ret
	main endp
	end main