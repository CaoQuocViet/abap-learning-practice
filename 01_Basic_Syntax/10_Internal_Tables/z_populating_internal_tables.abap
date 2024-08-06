*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& insert the data to the product information internal table with below structure
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
* inserting data to the internal table it1 from another 
* internal table it.
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

* Output:
* displaying IT table data...
* IFB1          IFB WASHING MACHINE         31000 
* IFB2          IFB SPLIT AC                38000
*---------------------------------------------------------------*
* displaying IT1 table data...
* IFB1          IFB WASHING MACHINE         31000
* IFB2          IFB SPLIT AC                38000

*=====================================================================*

*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& insert the data using APPEND to the product information internal table with below structure
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Internal table Structure creation
TYPES: BEGIN OF t_product,
       pid(10)     TYPE C,
       pname(40)   TYPE C,
       pamount(10) TYPE P,
       END OF t_product.

* Data & internal table declaration
DATA: wa TYPE t_product,
      it TYPE TABLE OF t_product.

wa-pid     = 'IFB1'.
wa-pname   = 'IFB WASHING MACHINE'.
wa-pamount = 31000.

* Appending data to the internal table
APPEND wa TO it.

* Reading internal table of index 1
READ TABLE it INTO wa INDEX 1.

* If sy-subrc equal to ZERO, the internal table read is successful.
* Otherwise, 'No Record Found' gets displayed.
IF sy-subrc = 0.
  WRITE: wa-pid, wa-pname, wa-pamount.
ELSE.
  WRITE 'No Record Found'.
ENDIF.

* Output:
* IFB1          IFB WASHING MACHINE         31000


*=====================================================================*

*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& insert the data using COLLECT to the product information internal table with below structure
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
      it TYPE TABLE OF t_product.

* inserting data to the internal table of INDEX 1
wa-pid     = 'IFB1'.
wa-pname   = 'IFB WASHING MACHINE'.
wa-pamount = 31000.
COLLECT wa INTO it.

* inserting data to the internal table of INDEX 2
wa-pid     = 'IFB2'.
wa-pname   = 'IFB SPLIT AC'.
wa-pamount = 38000.
COLLECT wa INTO it.

* Reading internal table for all the records
LOOP AT it INTO wa.
  IF sy-subrc = 0.
    WRITE :/ wa-pid, wa-pname, wa-pamount.
  ELSE.
    WRITE 'No Record Found'.
  ENDIF.
ENDLOOP. 

* Output:
* IFB1          IFB WASHING MACHINE         31000
* IFB2          IFB SPLIT AC                38000