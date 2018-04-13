
.bss
.lcomm buffer, 4096

.data
file_name: .asciz "/Users/chris/Desktop/test.txt"
copy_name: .asciz "/Users/chris/Desktop/testcopy.txt"

file_handle: .long 0
copy_file_handle: .long 0

copy_text: .quad 4096
copy_len: .quad 0
length: .quad 4096

.text
.globl _main
_main:

movq $0x2000005, %rax        # system open (5)
leaq file_name(%rip), %rdi   # path
movq $0x0000, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
movq $0444, %rdx             # mode (permissions)
syscall
movq %rax, file_handle(%rip)

movq $0x2000003, %rax          # system read (3)
movq file_handle(%rip), %rdi   # file handle
leaq buffer(%rip), %rsi
movq length(%rip), %rdx
syscall
movq %rax, copy_len(%rip)

movq $0x2000004, %rax        # system write (4)
movq $1, %rdi                # file handle STDOUT (1)
leaq buffer(%rip), %rsi      # address
movq copy_len(%rip), %rdx         # length
syscall

//movq $0x2000003, %rax        # system read (3)
//leaq file_handle(%rip), %rdi   # path
//movq copy_text(%rip), %rsi
//movq copy_len(%rip), %rdx
////movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
////movq $0666, %rdx             # mode (permissions)
//syscall
//movq %rax, copy_text(%rip)


# Copy old file to new file
//movq $0x20000E3, %rax        # system copyfile (227)
//leaq file_name(%rip), %rdi   # First path
//leaq copy_name(%rip), %rsi   # Second path
//movq $0666, %rdx             # mode (permissions)
//movq $0x0201, %rcx           # flags (02=O_CREAT, 01=O_WRONLY)
//syscall
//movq %rax, copy_file_handle(%rip)




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
