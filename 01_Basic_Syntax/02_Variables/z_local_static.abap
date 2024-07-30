*&---------------------------------------------------------------------*
*& Report  Z_LOCAL_STATIC
*&---------------------------------------------------------------------*
*& Write a simple program to get clear understanding of local, static variables working.
*&---------------------------------------------------------------------*

REPORT Z_LOCAL_STATIC.

WRITE: 'Local Variables - static variable'.

* Loop for 5 time.
DO 5 TIMES.
    " Perform addition subrountine.
    PERFORM addition.
ENDDO.

* Subroutine addition coding.
FORM addition.
    " Initializing local variable.
    DATA lv_local TYPE i VALUE 99.

    " Initializing static variable.
    STATICS lv_static TYPE i VALUE 99.

    " Adding 1 to local variable.
    lv_local = lv_local + 1.

    " Adding 1 to static variable.
    lv_static = lv_static + 1.

    " Display local, static variables.
    WRITE: / 'Local Variable:', lv_local, 'Static Variable:', lv_static.
ENDFORM.

" Output:
" Local Variables - static variable
" Local Variable: 100 Static Variable: 100
" Local Variable: 100 Static Variable: 101
" Local Variable: 100 Static Variable: 102
" Local Variable: 100 Static Variable: 103
" Local Variable: 100 Static Variable: 104