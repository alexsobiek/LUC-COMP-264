
/*Enumerated Type creates set of constants numbered 0 and upward*/
typedef enum {ACASE, BCASE, CCASE, DCASE, ECASE} modetype;

long switch4 (long *p1, long *p2, modetype action) {
    long result;
    switch (action) {
        case ACASE:
            result = *p2;            // movq (%rdi), %rax
            result = *p1 - result;   // subq (%rsi), %rax
            *p2 = result;            // movq %rax, (%rsi)
            break;                   // ret
        case BCASE:
            *p1 = 31L;               // movq $31, (%rdi)
            result = *p2;            // movq (%rsi), %rax
            break;                   // ret
        case CCASE:
            result = *p2;            // movq (%rdi), %rax
            result = *p1 + result;   // addq (%rsi), %rdx
            *p1 = result;            // movq %rdx, (%rdi)
            break;                   // ret
        case DCASE:
            result = *p2;             // movq (%rsi), %rax
            *p1 = result;             // movq %rax, (%rdi)
            result = 24L;             // movl $24, %eax
            break;                    // ret
        case ECASE:
            result = 24L;             // movl $24, %eax
            break;                    // ret
        default:
            result = 2;               // movl $2, %eax
            break;                    // ret
    }
    return result;
}




