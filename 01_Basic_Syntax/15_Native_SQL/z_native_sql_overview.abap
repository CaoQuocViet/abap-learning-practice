*&---------------------------------------------------------------------*
*& Report  Z_NATIVESQL
*&---------------------------------------------------------------------*
*& Display the LG product information from the table ZTC_TPRODUCT
*&---------------------------------------------------------------------*

REPORT  Z_NATIVESQL.

* Declaring work area
DATA: WA LIKE ZTC_TPRODUCT.

* Declaring header of the output.
WRITE: /'PRODUCTID  | PRODUCT                                  '
	'|    PAMOUNT    |'.
ULINE.

* VAR declaration of type PRODUCT-ID with value 'LG%'
* Value 'LG%' to retrieve all products of LG
DATA VAR LIKE WA-PRODUCTID VALUE 'LG%'.

* Retrieving data from the table record by record
EXEC SQL PERFORMING write_table.
    SELECT * FROM ZTC_TPRODUCT
    INTO :WA
    WHERE PRODUCTID LIKE :VAR.
ENDEXEC.
ULINE.

* Displaying the table fields
FROM write_table.
    WRITE: /WA-PRODUCTID, '|', WA-PRODUCT, '|', WA-PAMOUNT, '|'.
ENDFROM.

* Table Data:
*--------------------------------------------------------------*
* PRODUCTID    | PRODUCT                | PRODUCT_PRICE        *
*--------------------------------------------------------------*
* IFB1         | IFB Washing Machine    | 40000                *
* IFB2         | IFB Refrigerator       | 30000                *
* IFB3         | IFB Microwave Oven     | 20000                *
* LG1          | LG Washing Machine     | 40000                *
* LG2          | LG Refrigerator        | 30000                *
* LG3          | LG Microwave Oven      | 20000                *
* SAMSUNG1     | Samsung Washing Machine| 40000                *
* SAMSUNG2     | Samsung Refrigerator   | 30000                *
* SAMSUNG3     | Samsung Microwave Oven | 20000                *

* Output:
*--------------------------------------------------------------*
* PRODUCTID    | PRODUCT                | PRODUCT_PRICE        *
*--------------------------------------------------------------*
* LG1          | LG Washing Machine     | 40000                *
* LG2          | LG Refrigerator        | 30000                *
* LG3          | LG Microwave Oven      | 20000                *