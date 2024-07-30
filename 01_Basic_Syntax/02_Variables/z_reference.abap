*&---------------------------------------------------------------------*
*& Report  Z_REFERENCE
*&---------------------------------------------------------------------*
*& Write a simple program to get clear understanding of reference variable                   
*&---------------------------------------------------------------------*

REPORT  Z_REFERENCE.

* Local variable lv_number declaration.
DATA: lv_number TYPE i VALUE 7.

* Local reference variable lr_number declaration.
DATA: lr_number TYPE REF TO i.

* Displaying the local variable number before referencing
WRITE: / 'Local Variable (lv_number):', lv_number.

* Referencing lr_number to lv_number.
* lr_number = REF #( lv_number ). ==> This is new syntax for referencing.
GET REFERENCE OF lv_number INTO lr_number.

* Changing the value of lv_number using reference variable lr_number.
* lr_number = 10. ==> This is wrong, as we can't assign value directly to reference variable. Runtime error will occur.
* lr_number-> = 10. ==> This is correct, as we can assign value to the reference variable using -> operator.
lr_number->* = 10. " Use for complex references

* Displaying the local variable number after referencing and value change.
WRITE: / 'Local Variable (lv_number):', lv_number.

* Output:
* Local Variable (lv_number): 7
* Local Variable (lv_number): 10