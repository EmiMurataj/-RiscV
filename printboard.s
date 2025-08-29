.data
.globl printboard


#
#a0 Address of the first field of the board
#
#	-----------------------------
#	|      |      |      |      |
#	| 2048 |  128 |    8 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	| 1024 |   64 |    4 |    8 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  512 |   32 |  512 |  128 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  256 |   16 | 2048 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#
.text


printboard:
addi sp sp -16
sw s0 0(sp)     
sw s1 4(sp)      
sw s2 8(sp)      
sw ra 12(sp)
mv s2 a0         
li s0 0         
rreshtat:
li a0 4
la a1 row_border
ecall
li s1 0
rreshti1_loop:
li a0 11         
li a1 124        
ecall
li t0 0          
hapsira_loop:
li a0 11         
li a1 32        
ecall
addi t0 t0 1
li t1 6        
blt t0 t1 hapsira_loop
addi s1 s1 1
li t0 4
blt s1 t0 rreshti1_loop
li a0 11
li a1 124        
ecall
li a0 11
li a1 10         
ecall
li s1 0
rreshti2_loop:
li a0 11
li a1 124        
ecall
li t0 4
mul t1 s0 t0    
add t1 t1 s1    
slli t1 t1 1    
add t1 s2 t1    
lhu t2 0(t1)     
li t3 1          
li t4 10
check_digits:
blt t2 t4 done_digits
addi t3 t3 1
li t5 10
mul t4 t4 t5
j check_digits
done_digits:
li t5 0
print_spaces:
li a0 11
li a1 32        
ecall
addi t5 t5 1
li t6 5
sub t6 t6 t3    
blt t5 t6 print_spaces
li a0 1
mv a1 t2
ecall
li a0 11
li a1 32
ecall
addi s1 s1 1
li t0 4
blt s1 t0 rreshti2_loop
li a0 11
li a1 124        
ecall
li a0 11
li a1 10       
ecall
li s1 0
rreshti3_loop:
li a0 11
li a1 124       
ecall
li t0 0          
space_loop3:
li a0 11         
li a1 32         
ecall
addi t0 t0 1
li t1 6          
blt t0 t1 space_loop3
addi s1 s1 1
li t0 4
blt s1 t0 rreshti3_loop
li a0 11
li a1 124        
ecall
li a0 11
li a1 10        
ecall
addi s0 s0 1
li t0 4
blt s0 t0 rreshtat
li a0 4
la a1 row_border
ecall
lw s0 0(sp)
lw s1 4(sp)
lw s2 8(sp)
lw ra 12(sp)
addi sp sp 16
jr ra
.data
row_border: .asciiz "-----------------------------\n"