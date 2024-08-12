*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Insert data using COLLECT statement
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

TYPES: BEGIN OF t_product,
         pid(10)        TYPE C,
         pname(40)      TYPE C,
         pamount(10)    TYPE P,
       END OF t_product.

DATA: wa TYPE t_product,
      it TYPE TABLE OF t_product.

wa-pid = 'IFB1'.
wa-pname = 'IFB WASHING MACHINE'.
wa-pamount = 31000.
COLLECT wa INTO it.

wa-pid = 'IFB2'.
wa-pname = 'IFB REFRIGERATOR'.
wa-pamount = 45000.
COLLECT wa INTO it.

LOOP AT it INTO wa.
    IF sy-subrc = 0.
        WRITE: / wa-pid, wa-pname, wa-pamount.
    ELSE.
        WRITE 'No Record Found'.
    ENDIF.
ENDLOOP.

"Output:
"IFB1      IFB WASHING MACHINE             31000
"IFB2      IFB REFRIGERATOR                45000

" COLLECT statement used for populating the internal tables. COLLECT is used while inserting lines into an internal table with unique standard key.