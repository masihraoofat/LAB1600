.data
strings:
.asciz "Allo Hi"
num:
.asciz "Allo"
den:
.asciz "Hi"
.text
.globl main


main : 
push %ebp
mov %esp,%ebp
push %ebx

mask:
xor %eax, %eax          
xor %ecx, %ecx
xor %ebx, %ebx

setup:
movl $strings, %esi     

n_c:
lodsb                  

d:              
cmp $0x20, %al
je n_c2
cmp $0x41, %al
jb n_c2
cmp $0x5A, %al
jb a
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a

a:       
addl %eax, %ecx
jmp n_c

n_c2:
lodsb

d2:
cmp $0,%al
jz r
cmp $0x41, %al
jb n_c2
cmp $0x5A, %al
jb a_2
cmp $0x61, %al
jb n_c2
cmp $0x7A, %al 
jbe a_2

a_2:
addl %eax, %ebx
jmp n_c2

r:
movl %ecx, %eax
xorl %edx, %edx   # initialiser %edx a 0 avant la div (modif1)
divl %ebx
cmp $0x01, %eax   # comparer le quotient a 1
jg e_d           # imprimer le dénominateur si 1 est plus grand que le quotient 
jmp e_n

e_n:
push $num
call printf
add $4, %esp    # on clean apres le printf (modif3)
jmp bye

e_d:
push $den
call printf
add $4, %esp    # on clean apres le printf (modif4)

bye:
popl %ebx
popl %ebp
ret
