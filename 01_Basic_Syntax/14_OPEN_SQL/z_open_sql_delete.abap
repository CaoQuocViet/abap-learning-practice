*&---------------------------------------------------------------------*
*& Report  Z_OPENSQL
*&---------------------------------------------------------------------*
*& Written by TutorialsCampus
*&---------------------------------------------------------------------*

REPORT  Z_OPENSQL.

TABLES ZTC_TPRODUCT.
DATA: WA LIKE ZTC_TPRODUCT.

*Modifying table with Work area.
DELETE FROM ZTC_TPRODUCT WHERE PRODUCTID = 'IFB4'.

*Error handling
IF SY-SUBRC <> 0.
  WRITE: 'Data got Deleted, Return code is: ', SY-SUBRC.
ELSE.
  WRITE 'Data deleted successfully..'.
ENDIF.

* Output:
*---------------------------------------------------------------*
* PRODUCTID    | PRODUCT                | PRODUCT_PRICE        *
*---------------------------------------------------------------*
* IFB1         | IFB Washing Machine    | 40000                *
* IFB2         | IFB Refrigerator       | 30000                *
* IFB3         | IFB Microwave Oven     | 20000                *
* LG1          | LG Washing Machine     | 40000                *
* LG2          | LG Refrigerator        | 30000                *
* LG3          | LG Microwave Oven      | 20000                *
* SAMSUNG1     | Samsung Washing Machine| 40000                *
* SAMSUNG2     | Samsung Refrigerator   | 30000                *
* SAMSUNG3     | Samsung Microwave Oven | 20000                *