*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Using the APPEND statement
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

APPEND wa TO it.
APPEND INITIAL LINE TO it.
APPEND VALUE #( pid = 'IFB2' pname = 'IFB REFRIGERATOR' pamount = 45000 ) TO it.
APPEND VALUE #( pid = 'IFB3' pname = 'IFB MICROWAVE OVEN' pamount = 25000 ) TO it.

LOOP AT it INTO wa.
  WRITE: / wa-pid, wa-pname, wa-pamount.
ENDLOOP.

" Output:
" IFB1      IFB WASHING MACHINE             31000
"                                               0
" IFB2      IFB REFRIGERATOR                45000
" IFB3      IFB MICROWAVE OVEN              25000

*---------------------------------------------------------------------*
" The APPEND statement adds a single line/row to an existing internal table. APPEND statement uses the work area to append the line/row information into the table.

" APPEND inserts the data after the last line of the internal table. The work area can be either a header line or any other line with the same structure as an internal table.

" If the user uses the INITIAL LINE clause, the blank line appends to the table with the initial values in each field according to the definition.
    
" The SY-TABIX variable contains the index number of the appended line after each APPEND statement.