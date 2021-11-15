# lab03.asm - Recursive palindrome string tester
#   coded in  MIPS assembly using MARS
# for MYΥ-505 - Computer Architecture, Fall 2021
# Department of Computer Science and Engineering, University of Ioannina
# Instructor: Aris Efthymiou

.globl pdrome

###############################################################################
.data
anna:  .asciiz "anna"
bobob: .asciiz "bobob"

###############################################################################
.text
  la    $a0, anna
  addi  $a1, $zero, 4
  jal   pdrome
  add   $s0, $v0, $zero  # keep the return value

  la    $a0, bobob
  addi  $a1, $zero, 5
  jal   pdrome
  add   $s1, $v0, $zero  # keep the return value
  # both s1 and s0 must be 1 here

  addiu   $v0, $zero, 10    # system service 10 is exit
  syscall                   # we are outa here.


pdrome:
###############################################################################
# Write you code here.
# Any code above the label swapArray is not executed by the tester! 
###############################################################################
  #
  #
  #

  addi  $sp, $sp, -4  # Dimiourgw mia thesh apothikeyshs mias 1*4 bytes timhs sto stack 
  sw  $ra,  0($sp)  # Vazw tin timi tou $ra sti stoiba

  addi  $v1, $zero, 1 # Thetw to $v1=1 ws palindromo
  
main_function:  
  beq $a1, $zero, exit  # Elegxos isothtas tou size me to 0 diladi an einai keno
  lb  $t1, 0($a0) # Vazw ston $t1 ton proto char tou string
  beq $t1, $zero, exit  # An o char apo thn arxh einai to '/0' tote vgainei
  
  add $t2, $a0, $a1 #Ypologuzw tis dieythynsh tou char sapo to telos
  lb  $t3, -1($t0)  #O $t3 exei dieythynsh '/0' ara fortono to proigoumeno gramma me -1
  
  bne $t1, $t3, not_palindrome  # An to prwto char me to teleytaio diaferoun pame sto notpalindrome
  
  addi  $a0, $a0, 1 # Ena char parakatw stin arxi tou string/upostring
  addi  $a1,  $a1,  -2  # Meiwnw to size tou string/upostring kata 1, gia na parw to proigoumeno char apo to telos tou string/upostring
  
  jal pdrome  # Kalw anadromika thn pdrome
  j exit
  
not_palindrome:
  add $v1 $zero, $zero # Thetw $v1=0 ws mh palindromo
  
exit:
  lw  $ra,  0($sp)  # Gyrizw$ra apo to stack
  addi  $sp, $sp, 4 # kleinw th thesh pou eixa anoiksei sto stack
	

###############################################################################
# End of your code.
###############################################################################
  jr $ra

