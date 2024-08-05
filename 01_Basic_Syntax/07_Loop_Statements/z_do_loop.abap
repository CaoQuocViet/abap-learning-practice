*&---------------------------------------------------------------------*
*& Report  Z_DO_LOOP
*&---------------------------------------------------------------------*

REPORT  Z_DO_LOOP.

* Declaring Variable
DATA W_I TYPE I VALUE 1.

* Executes DO loop for 10 times
DO 10 TIMES.

* Displaying Iteration number.
  WRITE : /'Iteration ',W_I.

* Adding 1 to iteration number.
  W_I = W_I + 1.

ENDDO.

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
* 10