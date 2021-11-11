; Function parameters are stored in %rdi, %rsi, %rdx, %rcx, %r8, and %r9

.file "switch4-soln.c"
.text
.globl switch4
.type switch4, @function

; begin switch4()

switch4:
.LFB0:
.cfi_startproc
cmpl $4, %edx           ; Compare logical (%edx == 4)
ja .L2                  ; jump if above is true
movl %edx, %edx         ; 0 out %edx (result?)
jmp *.L4(,%rdx,8)       ; Indirect jump to the jump table at L4
.section .rodata
.align 8
.align 4

.L4:
    .quad .L3           ; case 1 (ACASE)
    .quad .L5           ; case 2 (BCASE)
    .quad .L6           ; case 3 (CCASE)
    .quad .L7           ; case 4 (DCASE)
    .quad .L9           ; case 5 (ECASE)
    .text

; (%rdi) and (%rsi), or *p1 and *p2 are pointers to longs somewhere else

.L2:                    ; Jump to here if %edx == 4 (why?)
    movl $2, %eax       ; Move 2 into %eax (lower 32 bits of %rax)
    ret
.L3:                    ; case "ACASE"
    movq (%rdi), %rax   ; Move %rdi (long p1) into %rax
    subq (%rsi), %rax   ; Subtract %rsi (long p2) from %rax (which has %rdi in it)
    movq %rax, (%rsi)   ; Move %rax into %rsi (long p2)
    ret
.L5:                    ; case "BCASE"
    movq $31, (%rdi)    ; Move 31 into %rdi (replacing long p1)
    movq (%rsi), %rax   ; Move %rsi (long p2) into %rax
    ret
.L6:                    ; case "CCASE"
    movq (%rdi), %rax   ; Move %rdi (long p1) into %rax
    movq %rax, %rdx     ; Move %rax into %rdx
    addq (%rsi), %rdx   ; Add %rsi (long p2) to %rdx and store in %rdx
    movq %rdx, (%rdi)   ; Move %rdx into %rdi (replacing long p1)
    ret
.L7:                    ; case "DCASE"
    movq (%rsi), %rax   ; Move %rsi (long p2) into %rax
    movq %rax, (%rdi)   ; Move %rax into %rdi
    movl $24, %eax      ; Move 24 into %eax (lower 32 bits of $rax)
    ret
.L9:                    ; case "ECASE"
    movl $24, %eax      ; Move 24 into %eax (lower 32 bits of $rax)
    ret
.cfi_endproc

; end switch4()


.LFE0:
.size switch4, .-switch4
.ident "GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
.section .note.GNU-stack,"",@progbits