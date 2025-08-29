.text

.globl move_one

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|----|		|----|----|----|----|----|
#	|  2 |  0 |  2 |  0 |  4 |	=> 	|  2 |  2 |  0 |  4 |  0 |
#	|----|----|----|----|----|		|----|----|----|----|----|
#
#	a0 1 iff something changed else 0



move_one:
mv t2 a0           
mv t3 a1           
beq t3 x0 done    
li t6 0            
li a0 0                
knp_zmr:
bge t6 t3 done   
slli t4 t6 2      
add t4 t2 t4     
lw t4 0(t4)        
addi t5 t6 -1    
slli t5 t5 2      
add t5 t2 t5      
lw t5 0(t5)        
lhu t0 0(t4)       
lhu t1 0(t5)      
beq t0 x0 lviz_next
bne t1 x0 lviz_next 
sh t0 0(t5)       
sh zero 0(t4)      
li a0 1             
lviz_next:
addi t6 t6 1      
j knp_zmr            
done:
ret      