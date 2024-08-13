*&---------------------------------------------------------------------*
*& Report  Z_COMMENTS
*&---------------------------------------------------------------------*
*& Full and partial line comments
*&---------------------------------------------------------------------*

REPORT  Z_COMMENTS.

* This is a line comment, applicable only to this line.
DATA: lv_number TYPE i. " Declare an integer variable

* This is a block comment, applicable to a larger block.
* It can span multiple lines and starts with (*).
START-OF-SELECTION.
  lv_number = 10. " Assign the value 10 to the variable

  WRITE: / 'The value of lv_number is:', lv_number. " Output the value of the variable

* This comment describes the purpose of the WRITE statement.
END-OF-SELECTION.