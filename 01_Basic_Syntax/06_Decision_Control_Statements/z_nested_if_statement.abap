*&---------------------------------------------------------------------*
*& Report  Z_NESTED_IF
*&---------------------------------------------------------------------*
*& Nested IF statement
*&---------------------------------------------------------------------*

REPORT  Z_NESTED_IF.

* Declaring Variables
DATA: W_OP1 TYPE I VALUE 90,
      W_OP2 TYPE I VALUE 70.

* If condition to verify both variables greater than equal or not
IF W_OP1 GE W_OP2.
    IF W_OP1 EQ W_OP2.
        WRITE 'Both variables are equal'.
    ELSE.
        WRITE 'W_OP1 GREATER THAN W_OP2'.
    ENDIF.
ELSE.
    WRITE 'W_OP1 LESS THAN W_OP2'.
ENDIF.

* Output:
* W_OP1 GREATER THAN W_OP2