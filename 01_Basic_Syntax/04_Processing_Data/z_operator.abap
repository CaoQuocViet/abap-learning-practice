*&---------------------------------------------------------------------*
*& Report  Z_OPERATORS
*&---------------------------------------------------------------------*
*& how the some of the operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_OPERATORS.

* Declaring variables
DATA: W_NUM1 TYPE I VALUE 10,
      W_NUM2 TYPE I VALUE 3,
      W_ADD  TYPE I,
      W_OB1 TYPE X VALUE 'B2',
      W_NOT TYPE X,
      W_R TYPE STRING,
      W_OP1 TYPE I VALUE 40,
      W_OP2 TYPE I VALUE 60,
      W_OP3 TYPE I VALUE 80.

* Adding two variables (Arithmetic Operation)
W_ADD = W_NUM1 + W_NUM2.
WRITE: 'Result of W_NUM1 + W_NUM2: ', W_ADD.

* Applying BIT-NOT on W_OB1 and produces the result W_NOT.
* (Bitwise NOT-Operation on Hexadecimal value)
W_NOT = BIT-NOT W_OB1.
WRITE: /'Result of BIT-NOT on W_OB1: ',W_NOT.

* Concatenation (&) of srings enclosed in two "|" (String Operation)
* Inclue the space between two strings and.
W_R = | HELLO | & | WORLD..!   |.
WRITE : /'Output-1:  ',W_R.

* Verifying W_OP1 less than W_OP2 (Relational Operation)
IF W_OP1 LT W_OP2.
  WRITE /'W_OP1 LESS THAN W_OP2'.
ENDIF.

* Logical AND expression (Boolean Operation)
IF ( W_OP1 LT W_OP2 ) AND ( W_OP2 LT W_OP3 ).
  WRITE /'Both logical expressions are true'.
ELSE.
  WRITE /'Both logical expressions are not true'.
ENDIF.

* Output:
* Result of W_NUM1 + W_NUM2:               13
* Result of BIT-NOT on W_OB1:   4D
* Output-1:  HELLO WORLD..!
* W_OP1 LESS THAN W_OP2
* Both logical expressions are true