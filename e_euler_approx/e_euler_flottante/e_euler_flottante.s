.data
iteration:
.int 3
iteration_FPU:  
.float 3      
factorial_value:
.float 0
factorial:
.float 0
e:
.float 0
reset:
.float 0
one:
.float 1
.text
.globl e_euler_flottante

e_euler_flottante:

push %ebp               
mov %esp,%ebp
push %ebx

## VOTRE CODE ICI 

fld1                        # load 1.0 sur la pile
fstp factorial_value        # Save 1.0 et pop de la pile

movl iteration_FPU, %ecx    # ini iteration
fld iteration_FPU           # load sur la pile

approximation_e:
    fmul    factorial_value # calcul : facteur * (itera - 1)
    fdiv    factorial        # div par facteur
    fadd    e                # add à la valeur e
    fstp    e                # save et pop de la pile

    fadd    one              
    fild    iteration_FPU    # load prochaine itera
    fmul                    # itera * dernier facteur
    fstp    factorial_value # save et pop de la pile

    cmp     iteration, %ecx # verif nb itera
    jl      approximation_e

pop %ebx
pop %ebp
ret
