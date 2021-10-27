; ===============================================================================
; First six arguments for a function are stored in %rdi, %rsi, %rdx, %r8, %r9
; %rdi = long z
; %rsi = int num
; %rax = long accum (function return) <- NO!
; %ecx = lower 32 bits of %rcx
; %sil = lower 8 bits of %rsi
; %cl = lower 8 bits of %rcx
;
; Operations
; movl a, b -> moves 4 bytes of data in b into a
; xorl a, b -> XOR a, b (4 bytes)
; movzbl a, b -> Take the sum of the 4 bytes stored in a and b and store it in a
; movq a, b ->  Move 64 bit value from b into a
; salq a, b -> 64 bit left shift of b by a
; andq a, b -> AND a, b
; xorq a, b -> XOR a, b
; testq a, b -> Tests equality of a and b
; jne a -> Jump if not equal to a
;
; Known registers
; %rdi = long z
; %rsi = int num
; %edx = loopvar
; %rax = return value (accum)
;
; ===============================================================================

        movl    $1, %edx   ; line #1    Move long $1 into %edx. %edx = 1, %edx is the loopvar
        xorl    %eax, %eax ; line #2    Set %eax equal to zero as XOR(A,A) will 0 out everything. %eax = 0 (for loopvar != 0)
        movzbl  %sil, %ecx ; line #3    Move the lower 8 bits of %rsi into %ecx
.L3:    movq    %rdx, %rsi ; line #4    Move %rdx into %rsi
        salq    %cl, %rdx  ; line #5    Left shift %rdx by %cl (lower 8 bits of %ecx which holds the lower 8 bits of %rsi)
        andq    %rdi, %rsi ; line #6    AND %rdi (long z), %rsi (int num)
        xorq    %rsi, %rax ; line #7    XOR %rsi, %rax
        testq   %rdx, %rdx ; line #8    Is %rdx equal to 0?
        jne     .L3        ; line #9    Jump if not equal to L3 (loop)
        ret                ; line #10   If equal, returnr