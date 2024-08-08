*&---------------------------------------------------------------------*
*& Report  Z_OPENSQL
*&---------------------------------------------------------------------*
*& Display the LG product information from the table ZTC_TPRODUCT
*&---------------------------------------------------------------------*

REPORT  Z_OPENSQL.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring cursor and work area
DATA: Cur TYPE CURSOR, WA LIKE ZTC_TPRODUCT.

* Opening the cursor
OPEN CURSOR Cur FOR SELECT * FROM ZTC_TPRODUCT
                    WHERE PROCDUCTID LIKE 'LG%'
                    ORDER BY PRODUCTID.

* Displaying header line for output
WRITE: /'PRODUCTID  |   PRODUCT     |    PROCDUCT PRICE|'.
ULINE.

* Do loop until End of Cursor
DO.

    " Retrieving data from the table record by record
    FETCH NEXT CURSOR Cur INTO WA.

    " Closing cursor when fetching is not sucessful
    IF sy-subrc <> 0.
        CLOSE CURSOR Cur.
        EXIT.
    ENDIF.

    " Displaying  table data for output
    WRITE: / WA-PRODUCTID, '|', WA-PRODUCT, '|', WA-PAMOUNT, '|'.
ENDDO.
ULINE.

* Output:
*-----------------------------------------------------------------------
* PRODUCTID  |   PRODUCT     |    PROCDUCT PRICE|
*-----------------------------------------------------------------------
* LG1        | LG WASHING MACHINE | 31.000|
* LG2        | LG REFRIGERATOR    | 41.000|
* LG3        | LG MICROWAVE       | 21.000|
*-----------------------------------------------------------------------