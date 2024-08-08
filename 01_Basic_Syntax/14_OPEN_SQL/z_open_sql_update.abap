*&---------------------------------------------------------------------*
*& Report  Z_OPENSQL
*&---------------------------------------------------------------------*

REPORT  Z_OPENSQL.

* Specifying table name
TABLES ZTC_TPRODUCT.
DATA: WA LIKE ZTC_TPRODUCT.

* Retrieving data from the table with product ID
SELECT *
    INTO WA
    FROM ZTC_TPRODUCT
    WHERE PRODUCTID = 'LG4'.
ENDSELECT.

* Assigning new amount for the LG4 product
WA-PRODUCT_PRICE = 520000.

* Updating the table with work area
UPDATE ZTC_TPRODUCT FROM WA.

* Error handling
IF sy-subrc = 0.
  WRITE: /'Record updated successfully'.
ELSE.
  WRITE: /'Record update failed, 
  Return code is: ', sy-subrc.
ENDIF.

* Output:
* Record updated successfully