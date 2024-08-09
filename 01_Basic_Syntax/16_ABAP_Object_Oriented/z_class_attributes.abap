*&---------------------------------------------------------------------*
*& Report  Z_ATTRIBUTES
*&---------------------------------------------------------------------*
*& Define instance variable and static variables
*&---------------------------------------------------------------------*

REPORT  Z_ATTRIBUTES.

* Class and Method definition
CLASS classnew DEFINITION.
    PUBLIC SECTION.
        " Defining instance variable inst_var
        DATA inst_var(30) TYPE C VALUE 'Instance Variable'.

        " Defining static variable stat_var
        CLASS-DATA stat_var(30) TYPE C VALUE 'Static Variable'.

        " Defining public method methodnew for the class classnew
        METHODS: methodnew.
ENDCLASS.

* Class and Method implementation
CLASS classnew IMPLEMENTATION.
    " Method implementation
    METHOD methodnew.
        " Displaying instance variable
        WRITE: / 'Instance Variable: ', inst_var.

        " Displays static variable
        WRITE: / 'Static Variable: ', stat_var.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

* Defining object of reference type to class
DATA: objectnew TYPE REF TO classnew.

* Creating object of class classnew
CREATE OBJECT objectnew.

* Call method using object
CALL METHOD: objectnew->methodnew.

" Output:
" Instance Variable: Instance Variable
" Static Variable: Static Variable