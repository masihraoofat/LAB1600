.data
caisse:
.int 25, 10, 5, 1 
#TODO initialiser les strings pour l'affichage des billets

change_strings: 
    .asciz "Le nombre de billets de %d$ est : %d\n"

.text
.globl main
main : 
    push %ebp
    mov %esp,%ebp
    push %ebx
    push %edi
    #TODO: Répondre a la question


    mov $caisse, %ebx     # caisse
    mov 8(%ebp), %eax     # montant du client   

boucle:
    cmp $0, %eax       # si somme == 0 -> fini
    jz fin

    mov (%ebx), %ecx      # prend un type de billet         

    cmp %ecx, %eax        # verif si billet trop gros
    jg prochain

    xor %edi, %edi        # initialise nb billets a 0
    xor %edx, %edx        # mm chose pour reste
    div %ecx             
    mov %eax, %edi        # resultat de la div = nb de billets
    mov %edx, %eax        # reste = nouveau total

    push %edi       
    push %ecx          
    push $change_strings 
    call printf          
    add $12, %esp                     

    jmp prochain

prochain:
    add $4, %ebx          
    cmp $16, %ebx         
    jae fin              
    jmp boucle           

fin:
    pop %edi
    #pop %esi
    pop %ebx
    pop %ebp
    ret