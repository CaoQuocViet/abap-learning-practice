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
* Iteration 1
* Iteration 2
* Iteration 3
* Iteration 4
* Iteration 5
* Iteration 6
* Iteration 7
* Iteration 8
* Iteration 9
* Iteration 10