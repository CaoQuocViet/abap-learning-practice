*&---------------------------------------------------------------------*
*& Report  Z_STRLEN
*&---------------------------------------------------------------------*
*& how the string length calculated in the ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_STRLEN.

" Length include spaces and special characters

* Declaring W_STR of character data type with 15 length
* and initialized with 'HELLO WORLD..!'.
DATA W_STR(25) TYPE C VALUE 'HELLO WORLD..!'.

* Declaring W_LEN of integer data type.
DATA W_STRL TYPE I.

* Getting the string length and assigning to W_STRL
W_STRL = STRLEN( W_STR ).

* Displaying string and string length
WRITE: / 'String:', W_STR,
       / 'String Length:', W_STRL.

* Output:
* String: HELLO WORLD..!
* String Length: 14