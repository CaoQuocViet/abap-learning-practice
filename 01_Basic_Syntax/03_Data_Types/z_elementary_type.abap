*&---------------------------------------------------------------------*
*& Report  Z_ELEMETARY_DATATYPE
*&---------------------------------------------------------------------*
*& Program with all elementary data types
*&---------------------------------------------------------------------*

REPORT  Z_ELEMETARY_DATATYPE.

* Declaring W_CHAR of character type of length 30 and
* initialized with 'character data type'.
DATA W_CHAR(30) TYPE C VALUE 'character data type'.

* Declaring W_NUM of numeric type of length 1 byte.
DATA W_NUM TYPE N LENGTH 100.

* Declaring W_INT of integer type.
DATA W_INT TYPE I VALUE 100.

* Declaring W_PCK of type compressed format.
DATA W_PCK TYPE P VALUE 100.

* Declaring W_FLT of floating point type.
DATA W_FLT TYPE F VALUE 100.

* Declaring W_DATE of date type.
DATA W_DATE TYPE D VALUE '20191231'.

* Declaring W_TIME of time type.
DATA W_TIME TYPE T.

* Declaring W_HEX of hexadecimal type binary format.
DATA W_HEX TYPE X VALUE 100.

* Assinging current date from system variable.
W_DATE = SY-DATUM.

* Assinging current time from system variable.
W_TIME = SY-UZEIT.

* Displaying the values of all data types.
WRITE: / 'Character (W_CHAR):', W_CHAR,
       / 'Numeric (W_NUM):', W_NUM,
       / 'Integer (W_INT):', W_INT,
       / 'Packed (W_PCK):', W_PCK,
       / 'Floating Point (W_FLT):', W_FLT,
       / 'Date (W_DATE):', W_DATE,
       / 'Time (W_TIME):', W_TIME,
       / 'Hexadecimal (W_HEX):', W_HEX,
       / 'System Date:', SY-DATUM,
       / 'System Time:', SY-UZEIT.

* Output:
* Character (W_CHAR): character data type
* Numeric (W_NUM): 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
* Integer (W_INT): 100
* Packed (W_PCK): 100
* Floating Point (W_FLT): 100,0000000000000000E+02
* Date (W_DATE): 20240730
* Time (W_TIME): 135758
* Hexadecimal (W_HEX): 64
* System Date: 30.07.2024
* System Time: 13:57:58