*&---------------------------------------------------------------------*
*& Report  Z_REPORT_PROG
*&---------------------------------------------------------------------*
*& implementing report programming in application program
*&---------------------------------------------------------------------*

REPORT  Z_REPORT_PROG
LINE-SIZE 120
LINE-COUNT 25(3)
NO STANDARD PAGE HEADING.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring cursor and work area
DATA: WA  LIKE ZTC_TPRODUCT,
      it  TYPE TABLE OF ZTC_TPRODUCT.

* Report primary and secondary heading
TOP-OF-PAGE.
    WRITE: /40 'PRODUCT INFOMATION REPORT' COLOR 4.
    ULINE.
    WRITE: /'PRODUCT ID' COLOR 1,30 'PRODUCT NAME' COLOR 2,100
              'PRODUCT AMOUNT' COLOR 3.
    ULINE.
END-OF-PAGE.

START-OF-SELECTION.
* Retrieving dât from the table with product ID
* and writing the table data into internal table
SELECT *
    INTO WA
    FROM ZTC_TPRODUCT ORDER BY PRODUCTID.
    INSERT WA INTO TABLE it.
ENDSELECT.

* Writing report footer
WRITE: /'REPORT HAS BEEN CREATED' COLOR 5.
ULINE.
SKIP.

* Output:
*                           PRODUCT INFOMATION REPORT
*-----------------------------------------------------------------------
* PRODUCT ID             PRODUCT NAME                       PRODUCT AMOUNT
*-----------------------------------------------------------------------
* IFB1                  IFB WASHING MACHINE                 31.000
* IFB2                  IFB REFRIGERATOR                    41.000
* IFB3                  IFB MICROWAVE                       21.000
* LG1                   LG WASHING MACHINE                  31.000
* LG2                   LG REFRIGERATOR                     41.000
* LG3                   LG MICROWAVE                        21.000
* SAMSUNG1              SAMSUNG WASHING MACHINE             31.000
* SAMSUNG2              SAMSUNG REFRIGERATOR                41.000
* SAMSUNG3              SAMSUNG MICROWAVE                   21.000
*-----------------------------------------------------------------------
* REPORT HAS BEEN CREATED
*-----------------------------------------------------------------------