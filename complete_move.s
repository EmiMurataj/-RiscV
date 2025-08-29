.text
.globl complete_move


#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.
.import merge.s
.import move_left.s

complete_move:
    addi sp sp -4    
    sw ra 0(sp)         
    li s0 0             
    li s1 0            
    jal move_left        
    add s0 s0 a0      
    add s1 s1 a1       
    beqz s1 u_kry       
    jal merge           
    add s0 s0 a0       
    add s1 s1 a1      
    beqz a0 skip_move   
    beqz a1 skip_move 
    jal move_left        
    add s0 s0 a0       
    add s1 s1 a1 
    j complete_move   
skip_move:
    mv a0 s0          
    mv a1 s1            
    lw ra 0(sp)        
    addi sp sp 4       
    ret                  
u_kry:
    li a0 0             
    li a1 0             
    lw ra 0(sp)         
    addi sp sp 4      
    ret                 
