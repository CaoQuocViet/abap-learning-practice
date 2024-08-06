*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Internal table Structure creation
TYPES:  BEGIN OF t_product,
            pid(10)     TYPE C,
            pname(40)   TYPE C,
            pamount(10) TYPE P,
        END OF t_product.

* Data & internal table declaration
DATA:   wa TYPE t_product,
        it TYPE TABLE OF t_product,
        it1 TYPE TABLE OF t_product.

* Inserting data to the internal table of INDEX 1
wa-pid     = 'IFB1'.
wa-pname   = 'IFB WASHING MACHINE'.
wa-pamount = 31000.
INSERT wa INTO TABLE it.

* Inserting data to the internal table of INDEX 2
wa-pid     = 'IFB2'.
wa-pname   = 'IFB SPLIT AC'.
wa-pamount = 38000.
INSERT wa INTO TABLE it.

WRITE 'displaying IT table data index 1...'.

* Reading internal table of index 1
READ TABLE it INTO wa INDEX 1.

IF sy-subrc = 0.
  WRITE :/ wa-pid, wa-pname, wa-pamount.
ELSE.
  WRITE 'No Record Found'.
ENDIF.

ULINE.

WRITE 'displaying IT table data with key IFB1...'.

* Reading internal table for all the records
READ TABLE it INTO wa WITH KEY pid = 'IFB1'.

IF sy-subrc = 0.
  WRITE :/ wa-pid, wa-pname, wa-pamount.
ELSE.
  WRITE 'No Record Found'.
ENDIF.
ULINE.

* Output:
* displaying IT table data index 1...
* IFB1          IFB WASHING MACHINE         31000
*---------------------------------------------------------------*
* displaying IT table data with key IFB1...
* IFB1          IFB WASHING MACHINE         31000