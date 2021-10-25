        movl    $1, %edx   ; line #1
        xorl    %eax, %eax ; line #2
        movzbl  %sil, %ecx ; line #3
.L3:    movq    %rdx, %rsi ; line #4
        salq    %cl, %rdx  ; line #5
        andq    %rdi, %rsi ; line #6
        xorq    %rsi, %rax ; line #7
        testq   %rdx, %rdx ; line #8
        jne     .L3        ; line #9
        ret                ; line #10