; //Template for Win32 Console Application,2018
; //  ע�⣺����C�Ŀ⺯��ʱ��ͨ�����޸�EAX��ECX��EDX�Ĵ�����ֵ��
; //  ���������pushad��popadָ����������8��ͨ�üĴ�����ֵ
include vcIO.inc
.data										 ;set data segment
   prompt		byte	 'Enter sinteger:',0 ;//�ַ���
   frmStr	    byte	 '%s',10,0           ;//�ַ����ĸ�ʽ��������0ah����\n��
   frmStr1	    byte	 '%d',0              ;//���������ʽ������
   frmStr2	    byte	 'sign=%d',10, 0	 ;//���������ʽ������
   sinteger     dword    ?
   sign         dword    ?
.code
	main	proc	
		pushad    ;//����8��ͨ�üĴ���  
		invoke  printf, offset frmStr, offset prompt              ;//��ʾ��ʾ�ַ���
		invoke  scanf, offset frmStr1, offset sinteger      ;//��������sinteger
		popad      ;//�ָ�8��ͨ�üĴ���
		mov    eax,sinteger	;��sintegerֵ���͸�eax
		xor    ebx,ebx		;��ebx��ֵΪ0
		cmp    eax,ebx		;�Ƚ�sinteger��0�Ĵ�С
		jnz    l1				;���sinteger!=0,��ת��l1
		mov    sign,0			;���sinteger==0,sign=0
		jmp	 done
	l1:	  
		jl l2				;���sinteger<0,��ת��l2
		mov    sign,1			;���sinteger>=0,sign=1
		jmp    done
	l2:	  
		mov    sign,-1		;���sinteger<0,sign=-1
    done:
		pushad                                                                      
		invoke  printf,offset frmStr2,sign       ;//���sign
		popad                                              
        ret                                                           ; return to windows
	main	endp
	; (insert additional procedures here)	
	end  main                                                       ;end of assembly

