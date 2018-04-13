#Chris Bendel
#Assignment 12

.data
output:    .ascii "Computer Architecture\n"
len: .quad (. - output)
file_name: .asciz "/Users/chris/Desktop/test.txt"
copy_name: .asciz "/Users/chris/Desktop/testcopy.txt"
test: .ascii ""
//copy_len: .quad 1024
copy_text: .ascii ""
copy_len: .quad 12
file_handle: .long 0
copy_file_handle: .long 0

.text
.globl _main
_main:

//movq $0x2000005, %rax        # system open (5)
//leaq file_name(%rip), %rdi   # path
//movq $0x0000, %rsi           # flags (0000=RD_ONLY)
//movq $0444, %rdx             # mode (permissions)
//syscall
//movq %rax, file_handle(%rip)

# Opens file to copy to
//movq $0x2000005, %rax        # system open (5)
//leaq file_copy_name(%rip), %rdi   # path
//movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
//movq $0666, %rdx             # mode (permissions)
//syscall
//movq %rax, copy_file_handle(%rip)

# Copy old file to new file
movq $0x2000227, %rax        # system copyfile (5)
leaq file_name(%rip), %rdi   # First path
leaq copy_name(%rip), %rsi   # Second path
movq $0666, %rdx             # mode (permissions)
movq $0x0201, %rcx           # flags (02=O_CREAT, 01=O_WRONLY)
syscall
//movq %rax, copy_file_handle(%rip)

//movq $0x2000003, %rax        # system read (3)
//leaq file_handle(%rip), %rdi   # path
//movq copy_text(%rip), %rsi
//movq copy_len(%rip), %rdx
////movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
////movq $0666, %rdx             # mode (permissions)
//syscall
//movq %rax, copy_text(%rip)

//movq $0x2000004, %rax        # system write (4)
//movq $1, %rdi                # file handle STDOUT (1)
//leaq copy_text(%rip), %rsi      # address
//movq copy_len(%rip), %rdx         # length
//syscall
//
//movq $0x2000004, %rax        # system write (4)
//movq file_handle(%rip), %rdi # file handle
//leaq output(%rip), %rsi      # address
//movq len(%rip), %rdx         # length
//syscall

//movq $0x2000006, %rax        # system close (6)
//movq file_handle(%rip), %rdi # file handle
//syscall

movq $0x2000001, %rax        # system exit (1)
movq $0, %rdi                # return value
syscall

.end
