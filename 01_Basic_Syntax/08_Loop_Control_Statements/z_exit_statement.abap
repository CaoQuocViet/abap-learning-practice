*&---------------------------------------------------------------------*
*& Report  Z_EXIT
*&---------------------------------------------------------------------*

REPORT  Z_EXIT.

* Declaring Variable
DATA: W_I TYPE I VALUE 0.

* DO loop iterates 10 times
DO 10 TIMES.

* incrementing Iteration number
  W_I = W_I + 1.

* Breaks the loop when iteration equals to 5.
  IF W_I EQ 5.
    EXIT.
  ENDIF.

* Displays Iteration number
  WRITE : /'Iteration ',W_I.

ENDDO.

* Output
* Iteration 1
* Iteration 2
* Iteration 3
* Iteration 4