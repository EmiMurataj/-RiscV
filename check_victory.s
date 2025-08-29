.text
.globl check_victory


#
#	a0 board address
#	a1 board length
#
#	a0 == 1 iff 2048 found
#

check_victory:
li t1 2048      
mv t2 a0   
loop:
beq a1 x0 not_found 
lhu t0 0(t2)        
beq t0 t1 victory    
addi t2 t2 2       
addi a1 a1 -1      
j loop
victory:
li a0 1             
jr ra
not_found:
li a0 0            
jr ra
