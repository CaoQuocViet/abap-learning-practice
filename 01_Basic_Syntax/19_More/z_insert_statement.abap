*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Written by TutorialsCampus
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* internal table Structure creation
TYPES: BEGIN OF t_product,
       pid(10)     TYPE C,
       pname(40)   TYPE C,
       pamount(10) TYPE P,
       END OF t_product.

* Data & internal table declaration
DATA: wa TYPE t_product,
      it TYPE TABLE OF t_product,
      it1 TYPE TABLE OF t_product.

* inserting data to the internal table of INDEX 1
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

WRITE 'displaying IT table data...'.
* Reading internal table for all the records
LOOP AT it INTO wa.
  IF sy-subrc = 0.
    WRITE :/ wa-pid, wa-pname, wa-pamount.
  ELSE.
    WRITE 'No Record Found'.
  ENDIF.
ENDLOOP.

ULINE.

INSERT LINES OF it INTO TABLE it1.

WRITE 'displaying IT1 table data...'.
* Reading internal table for all the records
LOOP AT it1 INTO wa.
  IF sy-subrc = 0.
    WRITE :/ wa-pid, wa-pname, wa-pamount.
  ELSE.
    WRITE 'No Record Found'.
  ENDIF.
ENDLOOP.

" Output:
" displaying IT table data...
" IFB1      IFB WASHING MACHINE         31000
" IFB2      IFB SPLIT AC                38000
"                                           0
" IFB4      IFB REFRIGERATOR            45000
" IFB5      IFB MICROWAVE OVEN          25000
*---------------------------------------------------------------------*
" displaying IT1 table data...
" IFB1      IFB WASHING MACHINE         31000
" IFB2      IFB SPLIT AC                38000
"                                           0
" IFB4      IFB REFRIGERATOR            45000
" IFB5      IFB MICROWAVE OVEN          25000

" Không được chỉ định INDEX ở đây, thêm tuyến tính vào cuối bảng