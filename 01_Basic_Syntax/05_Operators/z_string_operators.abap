*&---------------------------------------------------------------------*
*& Report  Z_STRING_OPERATORS
*&---------------------------------------------------------------------*
*& how the string operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_STRING_OPERATORS.

* Declaring varriables
DATA W_R TYPE STRING.

* Concatenation (&) of srings enclosed in two "|"
W_R = |   HELLO | & | WORLD..!   |.
WRITE : 'Output-1:  ',W_R.

* Concatenation (&&) of srings enclosed in two "|"
W_R = |   HELLO | && | WORLD..!   |.
WRITE : /'Output-2:  ',W_R.

* Concatenation (&) of srings enclosed in two "'"
W_R = '   HELLO ' & ' WORLD..!   '.
WRITE : /'Output-3:  ',W_R.

* Concatenation (&&) of srings enclosed in two "'"
W_R = '   HELLO ' && ' WORLD..!   '.
WRITE : /'Output-4:  ',W_R.

* Concatenation (&) of srings enclosed in two "`"
W_R = `   HELLO ` & ` WORLD..!   `.
WRITE : /'Output-5:  ',W_R.

* Concatenation (&&) of srings enclosed in two "`"
W_R = `   HELLO ` && ` WORLD..!   `.
WRITE : /'Output-6:  ',W_R.

* Output:
* Output-1:  [   HELLO  WORLD..!   ]
* Output-2:  [   HELLO  WORLD..!   ]
* Output-3:  [   HELLO  WORLD..!]
* Output-4:  [   HELLO WORLD..!]
* Output-5:  [   HELLO  WORLD..!   ]
* Output-6:  [   HELLO  WORLD..!   ]