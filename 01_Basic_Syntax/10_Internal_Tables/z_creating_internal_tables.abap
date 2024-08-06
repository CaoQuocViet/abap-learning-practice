*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Internal table structure creation
TYPES: BEGIN OF t_product
        pid(10)     TYPE C,
        pname(40)   TYPE C,
        pamount(10) TYPE P,
        END OF t_product.

* Data and internal table declaration
DATA:   wa_ TYPE t_product,
        it TYPE TABLE OF t_product.

wa-pid = 'P001'.
wa-pname = 'Product 1'.
wa-pamount = 100.

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
* P001      Product 1       100