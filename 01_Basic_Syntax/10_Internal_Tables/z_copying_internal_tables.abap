*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& Field to field copy
*&---------------------------------------------------------------------*

REPORT  Z_INTERNAL_TABLE.

* Specifying table name
TABLES ZTC_TPRODUCT.

* Declaring work area,, table it of type ZTC_TPRODUCT
DATA: wa LIKE ZTC_TPRODUCT,
      it TYPE TABLE OF ZTC_TPRODUCT.

* Retrieving data from the table
SELECT *
    FROM ZTC_TPRODUCT ORDER BY PRODUCTID.

* Moving table field data to work area field    
    MOVE ZTC_TPRODUCT-PRODUCTID TO wa-PRODUCTID.
    MOVE ZTC_TPRODUCT-PRODUCT TO wa-PRODUCT.
    MOVE ZTC_TPRODUCT-PRODUCT_PRICE TO wa-PRODUCT_PRICE.

* Inserting work area to table ỉt
    INSERT
ENDSELECT.

* Displaying header line for output
WrITE: /'PRODUCTID | PRODUCT | PRODUCT_PRICE'.
ULINE.

* Loop for displaying table it data
LOOP AT it INTO wa.

* Displaying table data line output
    IF sy-subrc = 0.
        WRITE: / wa-PRODUCTID, wa-PRODUCT, wa-PRODUCT_PRICE.
    ELSE.
        WRITE: / 'No Record Found'.
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
* LG3        | LG REFRIGERATOR                   | 45000                  |
* SAMSUNG1   | SAMSUNG WASHING MACHINE           | 31000                  |
* SAMSUNG2   | SAMSUNG SPLIT AC                  | 38000                  |
* SAMSUNG3   | SAMSUNG REFRIGERATOR              | 45000   


*=====================================================================*


*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& MOVE CORRESPONDING 
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
FROM ZTC_TPRODUCT ORDER BY PRODUCTID.

* Moving corresponding table fields data to work area fields
MOVE-CORRESPONDING ZTC_TPRODUCT TO WA.

* Inserting work area to table it.  
INSERT WA INTO TABLE it.
ENDSELECT.

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
* IFB2       | IFB SPLIT AC                      | 38000                  |
* IFB3       | IFB REFRIGERATOR                  | 45000                  |
* LG1        | LG WASHING MACHINE                | 31000                  |
* LG2        | LG SPLIT AC                       | 38000                  |
* LG3        | LG REFRIGERATOR                   | 45000                  |
* SAMSUNG1   | SAMSUNG WASHING MACHINE           | 31000                  |
* SAMSUNG2   | SAMSUNG SPLIT AC                  | 38000                  |
* SAMSUNG3   | SAMSUNG REFRIGERATOR              | 45000                  |


*=====================================================================*


*&---------------------------------------------------------------------*
*& Report  Z_INTERNAL_TABLE
*&---------------------------------------------------------------------*
*& COPY Internal table to internal table without header line
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

* Inserting work area to table it.
INSERT WA INTO TABLE it.

* inserting table it data to table it1.
it1  = it.
ENDSELECT.

* Displaying header line for output.
WRITE: /'PRODUCTID  | PRODUCT                                  '
'|    PRODUCT PRICE         |'.
ULINE.

* Loop for displaying table it1 data.
LOOP AT it1 INTO wa.

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
* IFB2       | IFB SPLIT AC                      | 38000                  |
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
*& COPY Internal table to internal table with header line
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
FROM ZTC_TPRODUCT ORDER BY PRODUCTID.

* Assigning table field to work area field.
MOVE ZTC_TPRODUCT-PRODUCTID TO WA-PRODUCTID.
MOVE ZTC_TPRODUCT-PRODUCT   TO WA-PRODUCT.
MOVE ZTC_TPRODUCT-PRODUCT_PRICE   TO WA-PRODUCT_PRICE.

* Inserting work area data to table it.
INSERT WA INTO TABLE it.
ENDSELECT.

* Copying internal table(it) data to another internal table (it1)
it1[] = it[].

* Displaying header line for output.
WRITE: /'PRODUCTID  | PRODUCT                                  '
'|    PRODUCT PRICE         |'.
ULINE.

* Loop for displaying table it1 data.
LOOP AT it1 INTO wa.

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
* IFB2       | IFB SPLIT AC                      | 38000                  |
* IFB3       | IFB REFRIGERATOR                  | 45000                  |
* LG1        | LG WASHING MACHINE                | 31000                  |
* LG2        | LG SPLIT AC                       | 38000                  |
* LG3        | LG REFRIGERATOR                   | 45000                  |
* SAMSUNG1   | SAMSUNG WASHING MACHINE           | 31000                  |
* SAMSUNG2   | SAMSUNG SPLIT AC                  | 38000                  |
* SAMSUNG3   | SAMSUNG REFRIGERATOR              | 45000   


" Độ phức tạp:
" Từng trường (Field to Field): Yêu cầu nhiều công việc thủ công hơn.
" MOVE CORRESPONDING: Tự động hóa sao chép các trường có tên giống nhau.
" Sao chép không có Header Line: Hiệu quả cho việc sao chép hàng loạt.
" Sao chép có Header Line: Bảo tồn thông tin Header Line quan trọng.

" Hiệu quả:
" Từng trường (Field to Field): Kiểm soát cao hơn nhưng tốn nhiều công sức.
" MOVE CORRESPONDING: Giảm thiểu lỗi do sai sót thủ công.
" Sao chép không có Header Line: Hiệu quả đối với dữ liệu lớn.
" Sao chép có Header Line: Đảm bảo tính toàn vẹn dữ liệu và Header Line.

" Thích hợp sử dụng:
" Từng trường (Field to Field): Thích hợp cho sao chép chọn lọc.
" MOVE CORRESPONDING: Phù hợp khi hai bảng có cấu trúc giống nhau.
" Sao chép không có Header Line: Được sử dụng để sao chép hàng loạt.
" Sao chép có Header Line: Bảo tồn thông tin quan trọng của Header Line.