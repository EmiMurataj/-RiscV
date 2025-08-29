.text
.globl place

# 	a0 board address
# 	a1 board length
#	a2 field number to place into
#	a3 number to place
#
#	a0 == 0 iff place succesfull else 1
#

# a0 - Base address of the board
# a1 - Length of the board
# a2 - Index to place into
# a3 - Value to place
# Returns:
#   a0 = 0 if placement is successful
#   a0 = 1 if placement fails (field is occupied or index is out of bounds)

place:
    mv t2 a0          
    mv t3 a1           
    li a0 1            
    bgeu a2 t3 done   
    slli t4 a2 1      
    add t5 t2 t4      
    lhu t6 0(t5)       
    bnez t6 done     
    sh a3 0(t5)        
    li a0 0            
done:
    ret