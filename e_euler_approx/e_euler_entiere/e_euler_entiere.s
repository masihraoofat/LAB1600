.text
.globl e_euler_entiere

e_euler_entiere:

 
push %ebp
mov %esp,%ebp
push %ebx

##VOTRE CODE ICI


push %ecx

    movl $1, %eax   # on initialise tout a 1
    movl $1, %ebx   
    movl $1, %ecx  
    movl $1, %edx   

    movl 8(%ebp), %ecx 

    cmp $0, %ecx    
    je fin_iteration

boucle_iteration:
    mul %ebx   
    incl %ebx  
    mov %ebx, %eax  
    div %ecx   
    mov %edx, %eax  
    add $1, %ecx  
    mov %eax, %ebx  
    cmp %ecx, %edi  
    jle boucle_iteration  


fin_iteration:
    pop %ecx   
    pop %ebx
    pop %ebp
    ret


# Q3.2.2 : on remarque que le nombre reste constant a 2. En effet, puisque l'approximation est entiere, la division 1/"gros nb" sera toujours egale a zero.
#               Donc, les iterations passees un certain point sont inutiles, car on ajoute toujours zero.