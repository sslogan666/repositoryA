include vcIO.inc
.data
	ch1		byte	?	;输入字母
	caps	byte	2	;标志,初始为2
	prompt	byte	"Enter a charachter:",10,0	;输入提示
	frm0	byte	"%s",0	;字符串的格式描述串
	frm1	byte	"%c",0	;输入格式描述串
	frm2	byte	"caps=%d",0	;结果格式化串
.code
	main proc
		pushad
		invoke printf,offset frm0,offset prompt	;输出提示串
		invoke scanf,offset frm1,offset ch1	;输入字符ch1
		popad
		mov	al,ch1	;将ch1的值传送给al
		cmp	al,'a'	;比较ch1和'a'的大小
		jb	l1		;如果ch1<'a',跳转到l1
		cmp	al,'z'	;如果ch1>='a',比较ch1和'z'的大小
		ja	l1		;如果ch1>'z',跳转到l1
		mov	caps,0	;如果ch1>='a' && ch1<='z',caps=0
	l1:	
		cmp	al,'A'	;比较ch1和'A'的大小
		jb	done	;如果ch1<'A',跳转到done
		cmp	al,'Z'	;如果ch1>='A',比较ch1和'Z'的大小
		ja	done	;如果ch1>'Z',跳转到done
		mov	caps,1	;如果ch1>='A' && ch1<='Z',caps=1
	done:
		pushad
		invoke printf,offset frm2,caps	;输出标志caps
		popad
		ret
	main endp
	end main