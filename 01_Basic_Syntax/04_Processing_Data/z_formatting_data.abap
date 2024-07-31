*&---------------------------------------------------------------------*
*& Report  Z_FORMATTING_EXAMPLE
*&---------------------------------------------------------------------*
*& Demonstrating various formatting options in ABAP
*&---------------------------------------------------------------------*

REPORT  Z_FORMATTING_DATA.

* Declaring variables with different data types
DATA: W_CHAR(30) TYPE C VALUE 'character data type',
      W_NUM TYPE N LENGTH 10 VALUE '1234567890',
      W_INT TYPE I VALUE 100,
      W_PCK TYPE P DECIMALS 2 VALUE '12345.67',
      W_FLT TYPE F VALUE '12345.67',
      W_DATE TYPE D VALUE '20240730',
      W_TIME TYPE T VALUE '135758',
      W_HEX TYPE X LENGTH 2 VALUE 'FF'.

* Displaying Character data type
* Hiển thị giá trị W_CHAR căn lề trái.
WRITE: / 'Character (W_CHAR):', W_CHAR LEFT-JUSTIFIED.

* Displaying Numeric data type
* Hiển thị giá trị W_NUM căn lề phải và bỏ qua số 0.
WRITE: / 'Numeric (W_NUM):', W_NUM RIGHT-JUSTIFIED NO-ZERO.

* Displaying Integer data type with no sign
* Hiển thị giá trị W_INT không có dấu.
WRITE: / 'Integer (W_INT):', W_INT NO-SIGN.

* Displaying Packed number with currency formatting
* Hiển thị giá trị W_PCK với định dạng tiền tệ USD.
WRITE: / 'Packed (W_PCK):', W_PCK CURRENCY 'USD'.

* Displaying Floating point number with specific decimals
* Hiển thị giá trị W_FLT với 4 số thập phân.
WRITE: / 'Floating Point (W_FLT):', W_FLT DECIMALS 4.

* Displaying Date in different formats
* Hiển thị giá trị W_DATE ở các định dạng khác nhau.
WRITE: / 'Date (W_DATE - DD/MM/YYYY):', W_DATE DD/MM/YYYY.
WRITE: / 'Date (W_DATE - MM/DD/YYYY):', W_DATE MM/DD/YYYY.
WRITE: / 'Date (W_DATE - YYMMDD):', W_DATE YYMMDD.

* Displaying Time in default format
* Hiển thị giá trị W_TIME ở định dạng mặc định.
WRITE: / 'Time (W_TIME):', W_TIME.

* Displaying Hexadecimal data
* Hiển thị giá trị W_HEX dưới dạng số hệ thập lục phân.
WRITE: / 'Hexadecimal (W_HEX):', W_HEX.

* Using AT option to start at specific position
* Hiển thị các giá trị bắt đầu từ các cột xác định.
WRITE: / 'Formatted Outputs with AT option:'.
WRITE AT 10 'Column 10'.
WRITE AT 20 'Column 20'.

* Using UNDER option to align text under previous line
* Hiển thị dòng Second line ngay dưới dòng First line.
WRITE: / 'UNDER option example:'.
WRITE / 'First line'.
WRITE / 'Second line' UNDER 'First line'.

* Using NO-GAP to eliminate space between fields
* Hiển thị các trường liền nhau mà không có khoảng trắng.
WRITE: / 'NO-GAP example:'.
WRITE 'Field1' NO-GAP.
WRITE 'Field2' NO-GAP.
WRITE 'Field3'.

* Displaying with color options
* Hiển thị các giá trị với màu sắc khác nhau.
WRITE: / 'Color Example: ',
       'Red' COLOR COL_BACKGROUND,
       'Green' COLOR COL_GROUP,
       'Blue' COLOR COL_HEADING.

* Using Intensified and Inverse options
* Hiển thị các giá trị với định dạng nhấn mạnh và đảo ngược.
WRITE: / 'Intensified Example: ', 'Intense Text' INTENSIFIED ON.
WRITE: / 'Inverse Example: ', 'Inverse Text' INVERSE ON.

* Using Hotspot option
* Hiển thị giá trị với khả năng click được.
WRITE: / 'Hotspot Example: ', 'Clickable Text' HOTSPOT ON.

* Displaying date and time with system variables
* Hiển thị ngày và giờ hệ thống với định dạng cụ thể.
DATA: SYSTEM_DATE TYPE D,
      SYSTEM_TIME TYPE T.

SYSTEM_DATE = SY-DATUM.
SYSTEM_TIME = SY-UZEIT.

WRITE: / 'System Date:', SYSTEM_DATE DD/MM/YYYY,
       / 'System Time:', SYSTEM_TIME USING EDIT MASK '__:__:__'.

* Quickinfo example for tooltip
WRITE: / 'Quickinfo Example:', 'Hover over me' QUICKINFO 'This is a tooltip'.

* Output:
" Character (W_CHAR): character data type 
" Numeric (W_NUM): 1234567890
" Integer (W_INT):            100
" Packed (W_PCK):         12.345,67
" Floating Point (W_FLT):         1,2346E+04
" Date (W_DATE - DD/MM/YYYY): 30.07.2024 
" Date (W_DATE - MM/DD/YYYY): 30.07.2024 
" Date (W_DATE - YYMMDD): 240730
" Time (W_TIME): 135758
" Hexadecimal (W_HEX): FF00
" FormattedColumn 10wColumn 20tion:
" UNDER option example:
" First line
" Second line
" NO-GAP example: Field1Field2Field3 
" Color Example: Red Green Blue 
" Intensified Example: Intense Text
" Inverse Example: Inverse Text
" Hotspot Example: Clickable Text
" System Date: 31.07.2024
" System Time: 04:32:
" Quickinfo Example: Hover over me