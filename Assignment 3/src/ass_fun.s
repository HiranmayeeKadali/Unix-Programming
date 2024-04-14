.data
	format: .asciz  "%d\n"
.text

.global fact
.global gcd
.global fun_call
.global fact_res
.global	two_equal
.global gcd_greater
.global loop
.global two
.global gcd_equal


fact: 
	cmp 	$1,	%rdi  # comparing  $1 and rdi
	jl	fact_res      #if less than jump to fact_res
	pushq	%rdi      # push rdi
	pushq	$1        # push $1
	popq	%rax	  # pop rax
	sub	%rbx,	%rdi   # substraction perfromed       
	jmp	    fun_call    #jumps to fun_call       
	popq	%rdi		# pops rdi
	imulq	%rdi,	%rbp  #singned multipication of rdi and rbp
	ret
fact_res:             
	movq    $1,	%rbp        # moving value          
        ret
fun_call:
	call fact             # calling function

gcd:
	cmp	%rdi,	%rsi    # comparing rdi(a) and rsi(b)
	je	gcd_equal       # if both are equal then jump to gcd_equal function
	cmp	%rsi,	%rdi    # comparing a and b 
	jg	gcd_greater     # if b greater than a  then it jumps to  gcd_greater
	sub	%rdi,	%rsi    # if above condition not statisficed then a-b is done
	jmp	loop            # it jumps to loop
gcd_greater:
	sub	%rsi,	%rdi    # substraction b-a
loop:
	jmp	gcd             # loop continuous
gcd_equal:
	pushq %rdi
	popq  %rbp
	ret


two:
	cmp 	$1,	%rdi
	jle	two_equal
	pushq	%rdi
	pushq	$2
	xor	%rbx,	%rbx
	xor	%rdx,	%rdx
	xor	%rax,	%rax
	popq	%rbx
	popq	%rax
	idivq	%rbx
	pushq	%rax 
	popq	%rdi
	call 	two
	add	$1,	%rdi   
	ret    
	
two_equal:
	movq    $0,	%rdi 	          
        ret
