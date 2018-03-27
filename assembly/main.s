#Chris Bendel
#Assignment 8.1
#Volume of a cylinder

.extern _getDouble
.extern _printDouble
.extern _printString

.data
radiusMsg: .asciz "Enter radius: "
heightMsg: .asciz "Enter height: "
resultOutput: .asciz "The radius of the cylinder is: "
radius: .double 0.0
radiusSquared: .double 0.0
height: .double 0.0
result: .double 0.0

.text
.globl _asmMain
_asmMain:

push %ebp
movl %esp, %ebp

#Get user input for radius
pushl $radiusMsg
call _printString
add $4, %esp
call _getDouble

#Store the user's input in radius var
fstpl radius

#Get user input for height
pushl $heightMsg
call _printString
add $4, %esp
call _getDouble

#Store the user's input in height var
fstpl height

#Init FPU
finit

#Radius squared by multiplying radius by itself
fldl radius
fldl radius
fmul %st(1), %st
fstpl radiusSquared

#pi * radiusSquared
fldpi
fldl radiusSquared
fmul %st(1), %st
fstpl result

#pi * radiusSquared * height
fldl result
fldl height
fmul %st(1), %st
fstpl result

#Print a nice string along with the result for the user
pushl $resultOutput
call _printString
add $4, %esp

#Print the result of the calculation
pushl result + 4
pushl result
call _printDouble

#Exit routine
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
