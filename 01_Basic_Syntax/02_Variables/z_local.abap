*&---------------------------------------------------------------------*
*& Report  Z_LOCAL
*&---------------------------------------------------------------------*
*& Write a simple program to get clear understanding of local variable
*&---------------------------------------------------------------------*

REPORT  Z_LOCAL.

* Loop for 5 time.
DO 5 TIMES.
    " Perform addition subrountine.
    PERFORM addition.
ENDDO.

* Subroutine addition coding.
FORM addition.
    " Initializing local variable.
    DATA lv_local TYPE i VALUE 99.

    " Adding 1 to local variable.
    lv_local = lv_local + 1.

    " Display local variable.
    WRITE: / 'Local Variable:', lv_local.
ENDFORM.

" Output:
" Local Variable: 100
" Local Variable: 100
" Local Variable: 100
" Local Variable: 100
" Local Variable: 100