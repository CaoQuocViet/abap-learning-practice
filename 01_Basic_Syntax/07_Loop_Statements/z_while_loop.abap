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
* Interation: 1
* Interation: 2
* Interation: 3
* Interation: 4
* Interation: 5
* Interation: 6
* Interation: 7
* Interation: 8
* Interation: 9