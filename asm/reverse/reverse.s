	.file 	"hello.c"
	.option nopic
	.text
	.align 	2
	.globl	main
	.type 	main, @function
main:
	li  s0, 13 			
	li  s1, 495 		
	li  s2, 511 		
	li  s3, 512
	sb  x0, 0(s2)	
wait:		
	lbu t0, 0(s2)
	add t0, t0, s1	
	lbu t1, 0(t0)	  
	beq t1, s0, nl
	j wait
nl:
	li t0, 10
	sb t0, 0(s3)
	li t0, 13
	sb t0, 0(s3)
print:
	lbu t0, 0(s2)	
	add t1, t0, s1	
	lb  t1, 0(t1)
	sb 	t1, 0(s3)
	li 	t1, 1
	sub t2, t0, t1
	sb	t2, 0(s2)
	nop
	nop	
	bge t2, t1, print 	
	li t0, 10
	sb t0, 0(s3)
	li t0, 13
	sb t0, 0(s3)
	nop
	j wait
	.size	main, .-main
	.ident	"GCC: (GNU) 7.1.1 20170509"

