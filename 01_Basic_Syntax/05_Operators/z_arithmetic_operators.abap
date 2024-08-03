*&---------------------------------------------------------------------*
*& Report  Z_ARITHMETIC_OPERATOR
*&---------------------------------------------------------------------*
*& how the arithmatic operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_ARITHMETIC_OPERATOR.

DATA:   W_NUM1 TYPE I VALUE 10,
        W_NUM2 TYPE I VALUE 3,
        W_ADD  TYPE I,
        W_SUB  TYPE I,
        W_MUL  TYPE I,
        W_DIVI TYPE I,
        W_DIV  TYPE I,
        W_MOD  TYPE I,
        W_POW  TYPE I.

* Adding tow variables
W_ADD = W_NUM1 + W_NUM2.
WRITE: /'Result of addition:', W_ADD.
" Result of addition: 13

* Subtracting two variables
W_SUB = W_NUM1 - W_NUM2.
WRITE: /'Result of subtraction:', W_SUB.
" Result of subtraction: 7

* Multiplying two variables
W_MUL = W_NUM1 * W_NUM2.
WRITE: /'Result of multiplication:', W_MUL.
" Result of multiplication: 30

* Dividing W_NUM1 by W_NUM2
W_DIVI = W_NUM1 / W_NUM2.
WRITE: /'Result of division:', W_DIVI.
" Result of division: 3

* Dividing W_NUM1 by W_NUM2 and produces the integer result
W_DIV = W_NUM1 DIV W_NUM2.
WRITE: /'Result of division:', W_DIV.
" Result of division: 3

* Dividing W_NUM1 by W_NUM2 and produces the positive remainder
W_MOD = W_NUM1 MOD W_NUM2.
WRITE: /'Result of division:', W_MOD.
" Result of division: 1

* W_NUM1 raised to the power of W_NUM2
W_POW = W_NUM1 ** W_NUM2.
WRITE: /'Result of power:', W_POW.
" Result of power: 1.000