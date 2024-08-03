*&---------------------------------------------------------------------*
*& Report  Z_RELATIONAL_OPERATORS
*&---------------------------------------------------------------------*
*& shows how the relational operations coded in the program
*&---------------------------------------------------------------------*

REPORT  Z_RELATIONAL_OPERATORS.

* Define some variables for demonstration
DATA: lv_var1 TYPE i VALUE 10,
      lv_var2 TYPE i VALUE 20,
      lv_var3 TYPE i VALUE 10,
      lv_result TYPE c LENGTH 1,
      lv_char1 TYPE c LENGTH 10 VALUE 'ABCD',
      lv_char2 TYPE c LENGTH 10 VALUE 'BCD',
      lv_char3 TYPE c LENGTH 10 VALUE 'CDE',
      lv_byte1 TYPE x LENGTH 10 VALUE 'ABCDEF12',
      lv_byte2 TYPE x LENGTH 10 VALUE 'BC12',
      lv_byte3 TYPE x LENGTH 10 VALUE '12',
      lv_number TYPE i VALUE 15,
      lv_test_var TYPE i,
      lv_pattern TYPE c LENGTH 10 VALUE 'A*D'.

* Relational operators for all data types
* Example using the Equal (=) and Not Equal (<>) Operators
IF lv_var1 = lv_var3.
  WRITE: / 'Equal Operator (=): lv_var1 is equal to lv_var3.'.
ELSE.
  WRITE: / 'Equal Operator (=): lv_var1 is not equal to lv_var3.'.
ENDIF.
" Equal Operator (=): lv_var1 is equal to lv_var3.

IF lv_var1 <> lv_var2.
  WRITE: / 'Not Equal Operator (<>): lv_var1 is not equal to lv_var2.'.
ELSE.
  WRITE: / 'Not Equal Operator (<>): lv_var1 is equal to lv_var2.'.
ENDIF.
" Not Equal Operator (<>): lv_var1 is not equal to lv_var2.

* Example using the Less Than (<) and Greater Than (>) Operators
IF lv_var1 < lv_var2.
  WRITE: / 'Less Than Operator (<): lv_var1 is less than lv_var2.'.
ENDIF.
" Less Than Operator (<): lv_var1 is less than lv_var2.

IF lv_var2 > lv_var1.
  WRITE: / 'Greater Than Operator (>): lv_var2 is greater than lv_var1.'.
ENDIF.
" Greater Than Operator (>): lv_var2 is greater than lv_var1.

* Example using the Less Than or Equal To (<=) and Greater Than or Equal To (>=) Operators
IF lv_var1 <= lv_var3.
  WRITE: / 'Less Than or Equal To Operator (<=): lv_var1 is less than or equal to lv_var3.'.
ENDIF.
" Less Than or Equal To Operator (<=): lv_var1 is less than or equal to lv_var3.

IF lv_var2 >= lv_var1.
  WRITE: / 'Greater Than or Equal To Operator (>=): lv_var2 is greater than or equal to lv_var1.'.
ELSE.
  WRITE: / 'Greater Than or Equal To Operator (>=): lv_var2 is not greater than or equal to lv_var1.'.
ENDIF.
"  Greater Than or Equal To Operator (>=): lv_var2 is greater than or equal to lv_var1.

* Example using the IS INITIAL and IS NOT INITIAL Operators
IF lv_test_var IS INITIAL.
  WRITE: / 'IS INITIAL Operator: lv_test_var is initial.'.
ELSE.
  WRITE: / 'IS INITIAL Operator: lv_test_var is not initial.'.
ENDIF.
" IS INITIAL Operator: lv_test_var is initial.

lv_test_var = 1.
IF lv_test_var IS NOT INITIAL.
  WRITE: / 'IS NOT INITIAL Operator: lv_test_var is not initial.'.
ELSE.
  WRITE: / 'IS NOT INITIAL Operator: lv_test_var is initial.'.
ENDIF.
" IS NOT INITIAL Operator: lv_test_var is not initial.

* Example using the BETWEEN Operator
IF lv_number BETWEEN 10 AND 20.
  WRITE: / 'BETWEEN Operator: lv_number is between 10 and 20.'.
ELSE.
  WRITE: / 'BETWEEN Operator: lv_number is not between 10 and 20.'.
ENDIF.
" BETWEEN Operator: lv_number is between 10 and 20.

* Relational operators for character-like data types
* Example using the Contains Only (CO) and Contains Not Only (CN) Operators
IF lv_char1 CO lv_char2.
  WRITE: / 'CO Operator: lv_char1 contains only characters from lv_char2.'.
ELSE.
  WRITE: / 'CO Operator: lv_char1 does not contain only characters from lv_char2.'.
ENDIF.
" CO Operator: lv_char1 does not contain only characters from lv_char2.

IF lv_char1 CN lv_char2.
  WRITE: / 'CN Operator: lv_char1 contains not only characters from lv_char2.'.
ENDIF.
" 

* Example using the Contains Any (CA) and Contains Not Any (NA) Operators
IF lv_char1 CA lv_char2.
  WRITE: / 'CA Operator: lv_char1 contains at least one character from lv_char2.'.
ENDIF.
" 

IF lv_char1 NA lv_char2.
  WRITE: / 'NA Operator: lv_char1 does not contain any characters from lv_char2.'.
ELSE.
  WRITE: / 'NA Operator: lv_char1 contains at least one character from lv_char2.'.
ENDIF.
" 

* Example using the Contains String (CS) and Contains No String (NS) Operators
IF lv_char1 CS lv_char3.
  WRITE: / 'CS Operator: lv_char1 contains the string from lv_char3.'.
ENDIF.
" 

IF lv_char1 NS lv_char3.
  WRITE: / 'NS Operator: lv_char1 does not contain the string from lv_char3.'.
ENDIF.

* Example using the Covers Pattern (CP) and No Pattern (NP) Operators
IF lv_char1 CP lv_pattern.
  WRITE: / 'CP Operator: lv_char1 fits the pattern A*D.'.
ENDIF.

IF lv_char1 NP lv_pattern.
  WRITE: / 'NP Operator: lv_char1 does not fit the pattern A*D.'.
ENDIF.

* Relational operators for byte-like data types
* Example using the Contains Only (BYTE-CO) and Contains Not Only (BYTE-CN) Operators
IF lv_byte1 BYTE-CO lv_byte2.
  WRITE: / 'BYTE-CO Operator: lv_byte1 contains only bytes from lv_byte2.'.
ENDIF.

IF lv_byte1 BYTE-CN lv_byte2.
  WRITE: / 'BYTE-CN Operator: lv_byte1 contains bytes not in lv_byte2.'.
ENDIF.

* Example using the Contains Any (BYTE-CA) and Contains Not Any (BYTE-NA) Operators
IF lv_byte1 BYTE-CA lv_byte3.
  WRITE: / 'BYTE-CA Operator: lv_byte1 contains at least one byte from lv_byte3.'.
ENDIF.

IF lv_byte1 BYTE-NA lv_byte3.
  WRITE: / 'BYTE-NA Operator: lv_byte1 does not contain any byte from lv_byte3.'.
ENDIF.

* Example using the Contains String (BYTE-CS) and Contains No String (BYTE-NS) Operators
IF lv_byte1 BYTE-CS lv_byte2.
  WRITE: / 'BYTE-CS Operator: lv_byte1 contains the string from lv_byte2.'.
ENDIF.

IF lv_byte1 BYTE-NS lv_byte2.
  WRITE: / 'BYTE-NS Operator: lv_byte1 does not contain the string from lv_byte2.'.
ENDIF.