*&---------------------------------------------------------------------*
*& Report  Z_STATIC
*&---------------------------------------------------------------------*
*& Program Written by TUTORIALSCAMPUS
*&---------------------------------------------------------------------*

REPORT  Z_STATIC.

* Loop for 5 time.
DO 5 TIMES.
    " Perform addition subrountine.
    PERFORM addition.
ENDDO.

* Subroutine addition coding.
FORM addition.
    " Initializing static variable.
    STATICS lv_static TYPE i VALUE 99.

    " Adding 1 to static variable.
    lv_static = lv_static + 1.

    " Display static variable.
    WRITE: / 'Static Variable:', lv_static.
ENDFORM.

" Output:
" Static Variable: 100
" Static Variable: 101
" Static Variable: 102
" Static Variable: 103