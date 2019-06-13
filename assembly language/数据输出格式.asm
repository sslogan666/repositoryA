;// Template for Win32 Console Application,2018。数据输出语句格式实例
;// 在汇编语言中，采用 invoke伪指令调用C语言的库函数：printf完成数据的输出
include vcIO.inc
.data                    ;set data segment
      hello                   byte  'Hello MASM32',0 ;字符串
      arrayByte           byte    1,2,3,4,5,6,7,8,9
      arrayWord         word    1,2,3,4,5,6,7,8,9
      arrayDword        dword   1,2,3,4,5,6,7,8,9
      frmStr	  byte	'%s',0ah,0  ;//显示字符串的格式描述串，0ah：“\n”
      frmStr1	  byte	' sum=%5d',0ah,0 
.code
  main	proc		
         ;显示字符串
           pushad                                                                         ;//保护8个通用寄存器  
                 invoke  printf,offset frmStr,offset hello                   ;//显示字符串
           popad                                                                           ;//恢复8个通用寄存器
        ;显示字节型数组和
         mov    ecx,lengthof arrayByte
         mov    esi,0                                                                     ;//寄存器相对寻址处理一维数组
         mov    eax,0                                                                    ;//eax=0,和变量
l1:               add     al,arrayByte[esi]                                        ;//eax=eax+arrayByte[esi]
                   inc      esi                                                              ;//esi指向下一个元素
                   loop    l1
         pushad                                                                           ;//保护8个通用寄存器  
              movsx    eax,al                                                          ;//8位有符号数等值扩展为32位有符号数
              invoke  printf,offset frmStr1,eax                               ;//按格式显示数值
         popad     
       ;显示字型数组和
        mov    ecx,lengthof arrayWord
        mov    esi,0                                                ;寄存器相对寻址处理一维数组
        mov    eax,0                                               ;eax=0,和变量
l2:               add     ax,arrayWord[esi*2]            ;eax=eax+arrayByte[esi]
                   inc      esi                                        ;esi指向下一个元素
                   loop    l2
        pushad                                                      ;保护8个通用寄存器  
             movsx    eax,ax                                   ;8位有符号数等值扩展为32位有符号数
             invoke  printf,offset frmStr1,eax         ;按格式显示数值
        popad     
       ;显示双字型数组和
        mov    ecx,lengthof arrayDword
        mov    esi,0                                                  ;//寄存器相对寻址处理一维数组
        mov    eax,0                                                 ;//eax=0,和变量
l3:               add     eax,arrayDword[esi*4]          ;//eax=eax+arrayByte[esi]
                   inc      esi                                          ;//esi指向下一个元素
                   loop    l3
        pushad                                                           ;//保护8个通用寄存器  
             invoke  printf,offset frmStr1,eax               ;//按格式显示数值
        popad     
		invoke _getch                                ;//pause
        ret                                                  ;//return to windows
  main	endp
	;// (insert additional procedures here)	
end  main  ;end of assembly

