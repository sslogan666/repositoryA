include vcIO.inc
.data
	frm1	byte	"sum_max=%d",10,0
	frm2	byte	"n_max=%d",10,0
.code
	main proc
		xor eax,eax	;�ۼӺͣ���ʼ��Ϊ0
		mov ecx,0	;��ǰҪ��������֣���ʼ��Ϊ0
		again:
			inc ecx	;ecx++
			add eax,ecx	;�����ۼ�
			jno again	;�ж��Ƿ������û����������ѭ��
			sub eax,ecx	;����������ۼӺͼ�ȥ�ӵ����һ������
			dec ecx		;��ȥecx��ӵ�1
			pushad
			invoke printf,offset frm1,eax	;������������£������ۼӺ�
			popad
			pushad
			invoke printf,offset frm2,ecx	;�����Ӧ��n
			popad
	main endp
	end main