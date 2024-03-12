.text
.globl e_euler_entiere

e_euler_entiere:

 
push %ebp
mov %esp,%ebp
push %ebx

##VOTRE CODE ICI

    movl $1, %ebx      # denominator
    movl 8(%ebp), %edx # input

    movl $1, %eax      # resultat
    movl $1, %ecx      # counter 

    cmp $0, %edx       # verif cas ou n=0
    je fin_iteration   # 

boucle_iteration:
    cmpl %edx, %ebx    # verif counter
    jge fin_iteration

    imull %ebx, %ecx   # calcul de n!
    movl %ecx, %ebx    

    idivl %ebx         # 1/n!
    addl %eax, %ecx    # on ajoute a "e"
    
    addl $1, %ebx      # counter +1

    jmp boucle_iteration

fin_iteration: 
    pop %ebx
    pop %ebp
    ret


# Q3.2.2 : on remarque que le nombre reste constant a 2. En effet, puisque l'approximation est entiere, la division 1/"gros nb" sera toujours egale a zero.
#               Donc, les iterations passees un certain point sont inutiles, car on ajoute toujours zero.