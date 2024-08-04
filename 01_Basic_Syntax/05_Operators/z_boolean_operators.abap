*&---------------------------------------------------------------------*
*& Report  Z_BOOLEAN_OPERATORS
*&---------------------------------------------------------------------*
*& how the Boolean operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_BOOLEAN_OPERATORS.

* Declaring Variables
DATA: W_OP1 TYPE I VALUE 40,
      W_OP2 TYPE I VALUE 60,
      W_OP3 TYPE I VALUE 80.

* Logical AND expression
IF ( W_OP1 LT W_OP2 ) AND ( W_OP2 LT W_OP3 ).
  WRITE 'Both logical expressions are true'.
ELSE.
  WRITE 'Both logical expressions are not true'.
ENDIF.

* Logical NOT operator
IF NOT ( W_OP2 GT W_OP3 ).
  WRITE /'W_OP2 LESS THAN W_OP3'.
ENDIF.

* Logical OR operator
IF ( W_OP1 LT W_OP2 ) OR ( W_OP2 GT W_OP3 ).
  WRITE /'Either one of the logical expression is true'.
ELSE.
  WRITE /'Neither one of the logical expression is true'.
ENDIF.

* Output:
* Both logical expressions are true
* W_OP2 LESS THAN W_OP3
* Either one of the logical expression is true

" NOT: Negotiation of logical expression with NOT
" AND: True when all the logical expressions are combined with AND are true
" EQUIV: True when all the logical expressions are combined with EQUIV are true or false
" OR: True when all the logical expressions are combined with OR are true or any one of the logical expression is true