*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Read the data from product information internal table
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

* inserting data to the internal table of INDEX 2
wa-pid     = 'IFB2'.
wa-pname   = 'IFB SPLIT AC'.
wa-pamount = 38000.
INSERT wa INTO TABLE it.

INSERT INITIAL LINE INTO TABLE it.

INSERT VALUE #( pid = 'IFB4' pname = 'IFB REFRIGERATOR' pamount = 45000 ) INTO TABLE it.

INSERT VALUE #( pid = 'IFB5' pname = 'IFB MICROWAVE OVEN' pamount = 25000 ) INTO TABLE it.

WRITE /'displaying IT table data INDEX 3 data...'.

READ TABLE it INTO wa INDEX 3.

IF sy-subrc = 0.
  WRITE :/ wa-pid, wa-pname, wa-pamount.
ELSE.
  WRITE 'No Record Found'.
ENDIF.

ULINE.

WRITE /'displaying IT table data with key IFB1...'.

READ TABLE it INTO wa WITH KEY pid = 'IFB1'.

IF sy-subrc = 0.
  WRITE :/ wa-pid, wa-pname, wa-pamount.
ELSE.
  WRITE 'No Record Found'.
ENDIF.
ULINE.

" Output:
" displaying IT table data INDEX 3 data...
"                                               0
*---------------------------------------------------------------------*
* displaying IT table data with key IFB1...
" IFB1      IFB WASHING MACHINE             31000