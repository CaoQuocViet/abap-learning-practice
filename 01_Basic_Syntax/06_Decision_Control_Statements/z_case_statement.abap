*&---------------------------------------------------------------------*
*& Report  Z_CASE_STATEMENT
*&---------------------------------------------------------------------*
*& Case statement
*&---------------------------------------------------------------------*

REPORT  Z_CASE_STATEMENT.

* Declaring variables
DATA: W_HEIGHT TYPE I VALUE 5.

* Case statement for validating height with different scenarios.
CASE W_HEIGHT.
  WHEN 2.
    WRITE 'The person is 2 feet tall'.
  WHEN 3.
    WRITE 'The person is 3 feet tall'.
  WHEN 4.
    WRITE 'The person is 4 feet tall'.
  WHEN 5.
    WRITE 'The person is 5 feet tall'.
  WHEN 6.
    WRITE 'The person is 6 feet tall'.
  WHEN 7.
    WRITE 'The person is 7 feet tall'.
  WHEN OTHERS.
    WRITE 'The person height is invalid'.
ENDCASE.

* Output:
* The person is 5 feet tall