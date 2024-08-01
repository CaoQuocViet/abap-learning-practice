*&---------------------------------------------------------------------*
*& Report  Z_STRING
*&---------------------------------------------------------------------*
*& How the strings created and used in the ABAP application program
*&---------------------------------------------------------------------*

REPORT  Z_STRING_EXAMPLE.

* Declaring W_STR1 of data type character with length 15
* and initializing with 'Hello World..!'
DATA:   W_STR1(15) TYPE C VALUE 'Hello World..!'.

* Declaring W_STR2 of data type character with length 15
        W_STR2(15) TYPE C.

* Assigning value of W_STR1 to W_STR2
W_STR2 = W_STR1.

* Displaying the value of W_STR1 and W_STR2
WRITE: / 'Value of W_STR1:', W_STR1,
        / 'Value of W_STR2:', W_STR2.

* Output:
* Value of W_STR1: Hello World..!
* Value of W_STR2: Hello World..!

" W_STR1 variable got assigned with string 'HELLO WORLD..!' at the time of declaration. W_STR2 variable got assigned with string 'HELLO WORLD..!' during the program execution