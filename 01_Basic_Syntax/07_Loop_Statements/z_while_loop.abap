*&---------------------------------------------------------------------*
*& Report  Z_WHILE_LOOP
*&---------------------------------------------------------------------*

REPORT  Z_WHILE_LOOP.

* Declaring Variables
DATA: W_I TYPE I VALUE 1.

* Interating loop 9 times
WHILE W_I < 10.
  WRITE: /'Interation: ' W_I.
  W_I = W_I + 1.
ENDWHILE.

* Output
* 1
* 2
* 3
* 4
* 5
* 6
* 7
* 8
* 9