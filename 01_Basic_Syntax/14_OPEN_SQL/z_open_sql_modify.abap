*&---------------------------------------------------------------------*
*& Report  Z_OPENSQL
*&---------------------------------------------------------------------*

REPORT  Z_OPENSQL.

TABLES ZTC_TPRODUCT.
DATA: WA LIKE ZTC_TPRODUCT.

*Assigning new data for the IFB4 product
WA-PRODUCTID = 'IFB4'.
WA-PRODUCT   = 'IFB dishwasher'.
WA-PRODUCT_PRICE   = 50000.

*Modifying table with Work area.
MODIFY ZTC_TPRODUCT FROM WA.

*Error handling
IF SY-SUBRC <> 0.
  WRITE: 'Data not Mofified, Return code is: ', SY-SUBRC.
ELSE.
  WRITE 'Data Modified/inserted successfully..'.
ENDIF.

* Output:
*---------------------------------------------------------------*
* PRODUCTID    | PRODUCT                | PRODUCT_PRICE        *
*---------------------------------------------------------------*
* IFB1         | IFB Washing Machine    | 40000                *
* IFB2         | IFB Refrigerator       | 30000                *
* IFB3         | IFB Microwave Oven     | 20000                *
* IFB4         | IFB dishwasher         | 50000                *
* LG1          | LG Washing Machine     | 40000                *
* LG2          | LG Refrigerator        | 30000                *
* LG3          | LG Microwave Oven      | 20000                *
* SAMSUNG1     | Samsung Washing Machine| 40000                *
* SAMSUNG2     | Samsung Refrigerator   | 30000                *
* SAMSUNG3     | Samsung Microwave Oven | 20000                *