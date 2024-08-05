*&---------------------------------------------------------------------*
*& Report  Z_CONTINUE
*&---------------------------------------------------------------------*

REPORT  Z_CONTINUE.

* Declaring Variable
DATA: W_I TYPE I VALUE 0.

* DO loop iterates 10 times
DO 10 TIMES.

* incrementing Iteration number
  W_I = W_I + 1.

* Skips displaying iteration between 5 and 7.
  IF W_I BETWEEN 5 AND 7.
    CONTINUE.
  ENDIF.

* Displays Iteration number
  WRITE : /'Iteration ',W_I.

ENDDO.

* Output
* Iteration 1
* Iteration 2
* Iteration 3
* Iteration 4
* Iteration 8
* Iteration 9
* Iteration 10