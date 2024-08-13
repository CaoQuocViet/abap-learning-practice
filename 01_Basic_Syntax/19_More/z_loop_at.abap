*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Read data using LOOP AT statement
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

TYPES: BEGIN OF t_product,
         pid(10)        TYPE C,
         pname(40)      TYPE C,
         pamount(10)    TYPE P,
       END OF t_product.

DATA: wa TYPE t_product,
      it TYPE TABLE OF t_product,
      it1 TYPE TABLE OF t_product.

wa-pid     = 'IFB1'.
wa-pname   = 'IFB WASHING MACHINE'.
wa-pamount = 31000.
INSERT wa INTO TABLE it.

wa-pid     = 'IFB2'.
wa-pname   = 'IFB SPLIT AC'.
wa-pamount = 38000.
INSERT wa INTO TABLE it.

INSERT INITIAL LINE INTO TABLE it.

INSERT VALUE #( pid = 'IFB4' pname = 'IFB REFRIGERATOR' pamount = 45000 ) INTO TABLE it.

WRITE /'displaying IT table data using LOOP AT statement...'.

LOOP AT it INTO wa.
    IF sy-subrc = 0.
        WRITE :/ wa-pid, wa-pname, wa-pamount.
    ELSE.
        WRITE 'No Record Found'.
    ENDIF.
ENDLOOP.

" Output:
" displaying IT table data using LOOP AT statement...
" IFB1          IFB WASHING MACHINE                31000
" IFB2          IFB SPLIT AC                       38000
"                                                      0
" IFB4          IFB REFRIGERATOR                   45000