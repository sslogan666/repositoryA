include vcIO.inc
.data
	ch1		byte	?	;������ĸ
	caps	byte	2	;��־,��ʼΪ2
	prompt	byte	"Enter a charachter:",10,0	;������ʾ
	frm0	byte	"%s",0	;�ַ����ĸ�ʽ������
	frm1	byte	"%c",0	;�����ʽ������
	frm2	byte	"caps=%d",0	;�����ʽ����
.code
	main proc
		pushad
		invoke printf,offset frm0,offset prompt	;�����ʾ��
		invoke scanf,offset frm1,offset ch1	;�����ַ�ch1
		popad
		mov	al,ch1	;��ch1��ֵ���͸�al
		cmp	al,'a'	;�Ƚ�ch1��'a'�Ĵ�С
		jb	l1		;���ch1<'a',��ת��l1
		cmp	al,'z'	;���ch1>='a',�Ƚ�ch1��'z'�Ĵ�С
		ja	l1		;���ch1>'z',��ת��l1
		mov	caps,0	;���ch1>='a' && ch1<='z',caps=0
	l1:	
		cmp	al,'A'	;�Ƚ�ch1��'A'�Ĵ�С
		jb	done	;���ch1<'A',��ת��done
		cmp	al,'Z'	;���ch1>='A',�Ƚ�ch1��'Z'�Ĵ�С
		ja	done	;���ch1>'Z',��ת��done
		mov	caps,1	;���ch1>='A' && ch1<='Z',caps=1
	done:
		pushad
		invoke printf,offset frm2,caps	;�����־caps
		popad
		ret
	main endp
	end main