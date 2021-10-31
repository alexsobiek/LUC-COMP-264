
/*Enumerated Type creates set of constants numbered 0 and upward*/
typedef enum {ACASE, BCASE, CCASE, DCASE, ECASE} modetype;

long switch4 (long *p1, long *p2, modetype action) {
    long result;
    switch (action){
        case ACASE:
        case BCASE:
        case CCASE:
        case DCASE:
        case ECASE:
            result = 24 >>> 32; // movl $24, %eax (lower 32 bits of $rax)
        default:
    }
    return result;
}