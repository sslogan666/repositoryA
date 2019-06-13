include vcIO.inc
.data
	aa	dword	?
	bb	dword	?
	cc	dword	?
	frm1	byte	"input abc:",10,0
	frm2	byte	"%d%d%d",0
	frm3	byte	"%s",0
	frm4	byte	"a=%d,b=%d,c=%d",10,0
.code
	main proc
		pushad
		invoke printf,offset frm3,offset frm1
		invoke scanf,offset frm2,offset aa,offset bb,offset cc
		invoke printf,offset frm4,aa,bb,cc
		popad
		mov eax,aa
		cmp eax,bb	;aa和bb比较
		jnl l1		;aa>=bb,跳转到l1
		xchg eax,bb	;aa<bb,交换两数
		mov	aa,eax
	l1:	
		mov eax,aa
		cmp eax,cc	;aa和cc比较
		jnl l2		;aa>=cc,跳转到l2
		xchg eax,cc	;aa<cc,交换两数
		mov aa,eax
	l2:
		mov eax,bb
		cmp eax,cc	;bb和cc比较
		jnl l3		;bb>=cc,跳转到l3
		xchg eax,cc	;bb<cc,交换两数
		mov bb,eax
	l3:
		pushad
		invoke printf,offset frm4,aa,bb,cc
		popad
		ret
	main endp
	end main