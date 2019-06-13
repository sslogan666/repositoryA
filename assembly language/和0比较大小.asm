; //Template for Win32 Console Application,2018
; //  注意：调用C的库函数时，通常会修改EAX、ECX、EDX寄存器的值。
; //  所以需采用pushad和popad指令来保护和8个通用寄存器的值
include vcIO.inc
.data										 ;set data segment
   prompt		byte	 'Enter sinteger:',0 ;//字符串
   frmStr	    byte	 '%s',10,0           ;//字符串的格式描述串，0ah：“\n”
   frmStr1	    byte	 '%d',0              ;//数据输入格式描述串
   frmStr2	    byte	 'sign=%d',10, 0	 ;//数据输出格式描述串
   sinteger     dword    ?
   sign         dword    ?
.code
	main	proc	
		pushad    ;//保护8个通用寄存器  
		invoke  printf, offset frmStr, offset prompt              ;//显示提示字符串
		invoke  scanf, offset frmStr1, offset sinteger      ;//读入整数sinteger
		popad      ;//恢复8个通用寄存器
		mov    eax,sinteger	;将sinteger值传送给eax
		xor    ebx,ebx		;给ebx赋值为0
		cmp    eax,ebx		;比较sinteger和0的大小
		jnz    l1				;如果sinteger!=0,跳转到l1
		mov    sign,0			;如果sinteger==0,sign=0
		jmp	 done
	l1:	  
		jl l2				;如果sinteger<0,跳转到l2
		mov    sign,1			;如果sinteger>=0,sign=1
		jmp    done
	l2:	  
		mov    sign,-1		;如果sinteger<0,sign=-1
    done:
		pushad                                                                      
		invoke  printf,offset frmStr2,sign       ;//输出sign
		popad                                              
        ret                                                           ; return to windows
	main	endp
	; (insert additional procedures here)	
	end  main                                                       ;end of assembly

