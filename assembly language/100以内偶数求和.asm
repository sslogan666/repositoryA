include vcIO.inc
.data
	frm1 byte "sum=%d",10,0	;�����ʽ������
.code
	main proc
		mov ecx,100	;����ָ��ѭ��������Ҳ�ǵ�ǰҪ���������
		mov eax,0	;ż���ĺͣ���ʼ��Ϊ0
	l1:	
		test ecx,1	;ecxΪ��ǰҪ��������֣���ecx��1�������㣬���ı��־λ��ecx�����ı�
		jnz l2		;�����Ľ����Ϊ0��˵����������ż������ת��l2
		add eax,ecx	;�����Ľ��Ϊ0��˵��������ż�������������һλΪ0���������ż��
	l2:	loop l1		;ecx=ecx-1�����ecx��=0,����ת��l1
		pushad
		invoke printf, offset frm1,eax	;���ż��֮��
		popad
	main endp
	end main