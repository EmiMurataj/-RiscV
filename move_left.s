.text
.globl move_left

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  0 |  2 |  0 |  4 |	=> 	|  2 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#
.import move_one.s

move_left:
addi sp sp -16
sw ra 0(sp)        
sw s0 4(sp)        
sw s1 8(sp)        
sw s2 12(sp)         
mv s0 a0           
mv s1 a1           
li s2 1            
ke_zmr:
beqz s2 done      
li s2 0          
mv a0 s0          
jal ra move_one    
mv s2 a0           
bnez s2 ke_zmr 
done:
lw ra 0(sp)        
lw s0 4(sp)        
lw s1 8(sp)        
lw s2 12(sp)       
addi sp sp 16        
ret