# Inner loop of inner4. data_t = double. OP = *.
# udata in %rbp, vdata %rax, sum in %xmm0, i in rcx, limit in rbx
.L15: # loop:
    vmovsd 0(%rbp,%rcx,8), %xmm1 # Get udata[i]
    vmulsd (%rax,%rcx,8), %xmm1, %xmm1 # Multiply by vdata[i]
    vaddsd %xmm1, %xmm0, %xmm0 # Add to sum
    addq $1, %rcx # Increment i
    cmpq %rbx, %rcx # Compare i:limit
    jl .L15 # If <, goto loop