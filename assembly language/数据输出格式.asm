;// Template for Win32 Console Application,2018�������������ʽʵ��
;// �ڻ�������У����� invokeαָ�����C���ԵĿ⺯����printf������ݵ����
include vcIO.inc
.data                    ;set data segment
      hello                   byte  'Hello MASM32',0 ;�ַ���
      arrayByte           byte    1,2,3,4,5,6,7,8,9
      arrayWord         word    1,2,3,4,5,6,7,8,9
      arrayDword        dword   1,2,3,4,5,6,7,8,9
      frmStr	  byte	'%s',0ah,0  ;//��ʾ�ַ����ĸ�ʽ��������0ah����\n��
      frmStr1	  byte	' sum=%5d',0ah,0 
.code
  main	proc		
         ;��ʾ�ַ���
           pushad                                                                         ;//����8��ͨ�üĴ���  
                 invoke  printf,offset frmStr,offset hello                   ;//��ʾ�ַ���
           popad                                                                           ;//�ָ�8��ͨ�üĴ���
        ;��ʾ�ֽ��������
         mov    ecx,lengthof arrayByte
         mov    esi,0                                                                     ;//�Ĵ������Ѱַ����һά����
         mov    eax,0                                                                    ;//eax=0,�ͱ���
l1:               add     al,arrayByte[esi]                                        ;//eax=eax+arrayByte[esi]
                   inc      esi                                                              ;//esiָ����һ��Ԫ��
                   loop    l1
         pushad                                                                           ;//����8��ͨ�üĴ���  
              movsx    eax,al                                                          ;//8λ�з�������ֵ��չΪ32λ�з�����
              invoke  printf,offset frmStr1,eax                               ;//����ʽ��ʾ��ֵ
         popad     
       ;��ʾ���������
        mov    ecx,lengthof arrayWord
        mov    esi,0                                                ;�Ĵ������Ѱַ����һά����
        mov    eax,0                                               ;eax=0,�ͱ���
l2:               add     ax,arrayWord[esi*2]            ;eax=eax+arrayByte[esi]
                   inc      esi                                        ;esiָ����һ��Ԫ��
                   loop    l2
        pushad                                                      ;����8��ͨ�üĴ���  
             movsx    eax,ax                                   ;8λ�з�������ֵ��չΪ32λ�з�����
             invoke  printf,offset frmStr1,eax         ;����ʽ��ʾ��ֵ
        popad     
       ;��ʾ˫���������
        mov    ecx,lengthof arrayDword
        mov    esi,0                                                  ;//�Ĵ������Ѱַ����һά����
        mov    eax,0                                                 ;//eax=0,�ͱ���
l3:               add     eax,arrayDword[esi*4]          ;//eax=eax+arrayByte[esi]
                   inc      esi                                          ;//esiָ����һ��Ԫ��
                   loop    l3
        pushad                                                           ;//����8��ͨ�üĴ���  
             invoke  printf,offset frmStr1,eax               ;//����ʽ��ʾ��ֵ
        popad     
		invoke _getch                                ;//pause
        ret                                                  ;//return to windows
  main	endp
	;// (insert additional procedures here)	
end  main  ;end of assembly

