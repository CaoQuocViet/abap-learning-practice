*&---------------------------------------------------------------------*
*& Report   Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Delete by index
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring work area, table it, it1 of type ZTC_TPRODUCT
DATA: WA  LIKE ZTC_TPRODUCT,
      it  TYPE TABLE OF ZTC_TPRODUCT,
      it1 TYPE TABLE OF ZTC_TPRODUCT.

* Retrieving data from the table
SELECT *
    INTO WA
    FROM ZTC_TPRODUCT ORDER BY PRODUCTID.

* Inserting work area data to table it.
    INSERT WA INTO TABLE it.
ENDSELECT.

* Deleting internal table data by index
DELETE it INDEX 2.

* Displaying header line for output.
WRITE: /'PRODUCTID  | PRODUCT                                  '
'|    PRODUCT PRICE         |'.
ULINE.

* Loop for displaying table it data.
LOOP AT it INTO wa.

* Displaying table data line output.
IF sy-subrc = 0.
    WRITE: / WA-PRODUCTID, '|', WA-PRODUCT,  '|',WA-PRODUCT_PRICE,  '|'.
ELSE.
    WRITE 'No Record Found'.
ENDIF.
ENDLOOP.
ULINE.

* Output:
* PRODUCTID  | PRODUCT                           |    PRODUCT PRICE         |
*------------------------------------------------------------------*
* IFB1       | IFB WASHING MACHINE               | 31000                  |
* IFB3       | IFB REFRIGERATOR                  | 45000                  |
* LG1        | LG WASHING MACHINE                | 31000                  |
* LG2        | LG SPLIT AC                       | 38000                  |
* LG3        | LG REFRIGERATOR                   | 45000                  |
* SAMSUNG1   | SAMSUNG WASHING MACHINE           | 31000                  |
* SAMSUNG2   | SAMSUNG SPLIT AC                  | 38000                  |
* SAMSUNG3   | SAMSUNG REFRIGERATOR              | 45000  


*=====================================================================*


*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Delete with key
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring work area, table it of type ZTC_TPRODUCT
DATA: WA  LIKE ZTC_TPRODUCT,
    it  TYPE TABLE OF ZTC_TPRODUCT.

* Retrieving data from the table
SELECT *
INTO WA
FROM ZTC_TPRODUCT ORDER BY PRODUCTID.

* Inserting work area to table it.  
INSERT WA INTO TABLE it.
ENDSELECT.

* Delete the row WHERE the PRODUCTID is LG3	
DELETE it WHERE PRODUCTID = 'LG3'.

* Displaying header line for output.
WRITE: /'PRODUCTID  | PRODUCT                                  '
'|    PAMOUNT    |'.
ULINE.

* Loop for displaying table it data.
LOOP AT it INTO wa.

* Displaying table data line output.
IF sy-subrc = 0.
    WRITE: / WA-PRODUCTID, '|', WA-PRODUCT,  '|',WA-PAMOUNT,  '|'.
ELSE.
    WRITE 'No Record Found'.
ENDIF.
ENDLOOP.
ULINE.

* Output:
* PRODUCTID  | PRODUCT                           |    PRODUCT PRICE         |
*------------------------------------------------------------------*
* IFB1       | IFB WASHING MACHINE               | 31000                  |
* IFB2       | IFB SPLIT AC                      | 38000                  |
* IFB3       | IFB REFRIGERATOR                  | 45000                  |
* LG1        | LG WASHING MACHINE                | 31000                  |
* LG2        | LG SPLIT AC                       | 38000                  |
* SAMSUNG1   | SAMSUNG WASHING MACHINE           | 31000                  |
* SAMSUNG2   | SAMSUNG SPLIT AC                  | 38000                  |
* SAMSUNG3   | SAMSUNG REFRIGERATOR              | 45000  