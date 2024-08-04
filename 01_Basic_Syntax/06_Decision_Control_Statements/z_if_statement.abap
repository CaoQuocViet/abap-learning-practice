*&---------------------------------------------------------------------*
*& Report  Z_SIMPLE_IF
*&---------------------------------------------------------------------*

REPORT  Z_SIMPLE_IF.

* Declaring Variable
DATA: W_OP1 TYPE I VALUE 90,
      W_OP2 TYPE I VALUE 70.

* IF condition to verify which variable is bigger
IF W_OP1 GT W_OP2.
  WRITE 'W_OP1 GREATER THAN W_OP2'.
ENDIF.

* Output:
* W_OP1 GREATER THAN W_OP2