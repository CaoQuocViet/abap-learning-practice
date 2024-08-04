*&---------------------------------------------------------------------*
*& Report  Z_IF_ELSE
*&---------------------------------------------------------------------*

REPORT  Z_IF_ELSE.

* Declaring Vairiables
DATA: W_OP1 TYPE I VALUE 90,
      W_OP2 TYPE I VALUE 70.

* IF conđition to veryfy both variables are equal or not
IF W_OP1 EQ W_OP2.
  WRITE 'Both variables are equal'.
ELSE.
  WRITE 'Both variables are not equal'.
ENDIF.

* Output:
* Both variables are not equal