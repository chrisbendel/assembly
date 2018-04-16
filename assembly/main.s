#Assignment 11

.bss
.lcomm buffer, 4096

.data
file_name: .asciz "/Users/chris/Desktop/test.txt"
copy_name: .asciz "/Users/chris/Desktop/newfile.txt"

file_handle: .long 0
copy_handle: .long 0

copy_len: .quad 0
length: .quad 4096

.text
.globl _main
_main:

movq $0x2000005, %rax        # Open the existing file so that we can read it
leaq file_name(%rip), %rdi
movq $0x0000, %rsi
movq $0444, %rdx
syscall
movq %rax, file_handle(%rip)

movq $0x2000003, %rax        # Read the old file contents into a buffer and get the length
movq file_handle(%rip), %rdi
leaq buffer(%rip), %rsi
movq length(%rip), %rdx
syscall
movq %rax, copy_len(%rip)

movq $0x2000006, %rax        # Close original file
movq file_handle(%rip), %rdi
syscall

//movq $0x2000004, %rax        # STD Out test
//movq $1, %rdi
//leaq buffer(%rip), %rsi
//movq copy_len(%rip), %rdx
//syscall

movq $0x2000005, %rax        # Open and create the new file to copy to
leaq copy_name(%rip), %rdi
movq $0x0201, %rsi
movq $0666, %rdx
syscall
movq %rax, copy_handle(%rip)

movq $0x2000004, %rax        # Write the old contents to the newly created file
movq copy_handle(%rip), %rdi
leaq buffer(%rip), %rsi
movq copy_len(%rip), %rdx
syscall


movq $0x2000006, %rax        # Close newly created file
movq copy_handle(%rip), %rdi
syscall

movq $0x2000001, %rax        # system exit (1)
movq $0, %rdi                # return value
syscall

.end
