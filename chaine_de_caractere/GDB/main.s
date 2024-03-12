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
mov1 $0, %edx   # initialiser %edx a 0 avant la div (modif1)
divl %ebx
cmp $0x00, %eax
jmp e_n
je e_d              
             

e_n:
push $num
call printf
add $4, %esp    # on clean apres le printf (modif2)
jmp bye

e_d:
push $den
call printf
add $4, %esp    # on clean apres le printf (modif2)

bye:
popl %ebx
popl %ebp
ret


# Q2.2.1
#	- n_c : Permet de parcourir la chaine et de calculer la somme des valeurs ASCII
#	- d : Permet de vérifier si une lettre est une majuscule ou une minuscule
#	- r : Défini le reste de la division et vérifie si ce reste est égal à zéro
#	- e_n : Défini le numérateur de la division. Il est utilisé si le reste n'est pas égal à zéro