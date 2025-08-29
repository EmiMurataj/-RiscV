.text
.globl move_check
#
#	a0 buffer address
#	a1 buffer length
#
#   a0 == 1 iff left move possible and would change something
#            else 0
#

move_check:
	 mv t2 a0
     mv t3 a1
     li a0 0
	
loop:

lhu t0 0(t2)
beq t0 x0  possible
lhu t1 2(t2)
beq t0 t1 possible
addi t2 t2 2
addi t3 t3 -1
j loop
possible:
li a0 1
jr ra
