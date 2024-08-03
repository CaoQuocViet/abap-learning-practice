*&---------------------------------------------------------------------*
*& Report  Z_BIT_OPERATORS
*&---------------------------------------------------------------------*
*& how the bitwise operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_BIT_OPERATORS.

DATA:   W_OP1 TYPE X VALUE 'B2',
        W_OP2 TYPE X VALUE 'A4',
        W_AND TYPE X,
        W_OR  TYPE X,
        W_XOR TYPE X,
        W_NOT TYPE X.

* Applying BIT-NOT on W_OP1 and produces the result W_NOT.
W_NOT = BIT-NOT W_OP1.
WRITE: /'Result of BIT-NOT on W_OP1:', W_NOT.

* Applying BIT-NOT on W_OP2 and produces the result W_NOT.
W_NOT = BIT-NOT W_OP2.
WRITE: /'Result of BIT-NOT on W_OP2:', W_NOT.

* Applying BIT-AND on W_OP1 and W_OP2 and produces the result W_AND.
W_AND = W_OP1 BIT-AND W_OP2.
WRITE: /'Result of BIT-AND on W_OP1 and W_OP2:', W_AND.

* Applying BIT-OR on W_OP1 and W_OP2 and produces the result W_OR.
W_OR = W_OP1 BIT-OR W_OP2.
WRITE: /'Result of BIT-OR on W_OP1 and W_OP2:', W_OR.

* Applying BIT-XOR on W_OP1 and W_OP2 and produces the result W_XOR.
W_XOR = W_OP1 BIT-XOR W_OP2.
WRITE: /'Result of BIT-XOR on W_OP1 and W_OP2:', W_XOR.

* Output:
* Result of BIT-NOT on W_OP1: 4D
* Result of BIT-NOT on W_OP2: 5B
* Result of BIT-AND on W_OP1 and W_OP2: A0
* Result of BIT-OR on W_OP1 and W_OP2: B6
* Result of BIT-XOR on W_OP1 and W_OP2: 16
