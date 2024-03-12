.data
string1:
.asciz  "chien" 
lenght1:
.int 5
string2:
.asciz  "niche"
lenght2:
.int 5

.text
.globl anagramme
anagramme: 

    ## Initialisation des registres
    movl    lenght1, %edx 
    cmpl    %edx, lenght2 
    jne     different_lengths   # pas meme longeur -> pas anagramme
    
    ## calcul somme 1
    mov     $0, %esi   # index
    mov     $string1, %edi
    mov     $0, %ebx   # ebx = 0 (pour la somme des lettres de string1)
    loop_string1:
        movzbl  (%esi, %edi), %eax
        cmp     %esi, lenght1     
        je      end_loop_string1  
        add     %eax, %ebx   # ajoute valeur lettre
        inc     %esi   # next lettre
        jmp     loop_string1
        
    end_loop_string1:
    
    ## calcul somme 2
    mov     $0, %esi   # réinitialiser l'index
    mov     $string2, %edi
    mov     $0, %ecx   # ecx = 0 (pour la somme des lettres de string2)
    loop_string2:
        movzbl  (%esi, %edi), %eax
        cmp     %esi, lenght1    
        je      end_loop_string2   
        add     %eax, %ecx  
        inc     %esi  
        jmp     loop_string2
    
    end_loop_string2:
    
    ## comparer sommes
    cmpl    %ebx, %ecx   
    je      same_sum   # somme egales -> anagramme
    
    mov     $255, %eax   # else -> pas d'anagramme
    ret
    
    different_lengths:
    mov     $1, %eax   
    ret 
    
    same_sum:
    mov     $0, %eax
    ret