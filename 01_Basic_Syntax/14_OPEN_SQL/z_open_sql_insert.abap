*&---------------------------------------------------------------------*
*& Report  Z_OPENSQL
*&---------------------------------------------------------------------*

REPORT  Z_OPENSQL.

* Specifying table name
TABLES ZTC_TPRODUCT.
DATA: WA LIKE ZTC_TPRODUCT.

* New record information to the table
WA-PRODUCTID = 'LG4'.
WA-PRODUCT = 'LG AIR CONDITIONER'.
WA-PRODUCT_PRICE = 51.000.

* Inserting new record into the table from work area
INSERT ZTC_TPRODUCT FROM WA.

* Result display and error handling
IF sy-subrc = 0.
  WRITE: /'Record inserted successfully'.
ELSE.
  WRITE: /'Record insertion failed, 
  Return code is: ', sy-subrc.
ENDIF.

* Output:
* Record inserted successfully