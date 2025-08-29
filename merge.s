.text
.globl merge

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  0 |  0 |  4 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.

merge:
li t0 0           
loop:
beq t0 a1 done   
slli t1 t0 2     
add t1 a0 t1     
lw t2 0(t1)       
li t3 0           
merged:
li t4 3           
bgt t3 t4 dont_merge_1
slli t5 t3 1     
add t5 t2 t5     
lhu t6 0(t5)          
addi t4 t3 1     
slli t4 t4 1     
add t4 t2 t4     
lhu s1 0(t4)      
beqz t6 dont_merge 
beqz s1 dont_merge 
bne t6 s1 dont_merge
add t6 t6 s1     
sh t6 0(t5)       
sh zero 0(t4)     
dont_merge:
addi t3 t3 1     
j merged
dont_merge_1:
addi t0 t0 1     
j loop    
done:
ret