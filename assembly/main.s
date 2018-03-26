# External C++ functions
.extern _getDouble
.extern _printDouble
.extern _printString

.data
.balign 16 #16 byte alignment
radiusMsg: .asciz "Enter radius: "
heightMsg: .asciz "Enter height: "

.text
.globl _asmMain
_asmMain:
finit
fldpi
pushl $radiusMsg
call _printString
call _getDouble

call _printDouble

pushl $heightMsg
call _printString
call _getDouble

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
