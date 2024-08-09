*&---------------------------------------------------------------------*
*& Report  Z_METHODS
*&---------------------------------------------------------------------*
*& Define, call instance and static methods
*&---------------------------------------------------------------------*

REPORT  Z_METHODS.

* CLass and methods definition
CLASS classnew DEFINITION.
    PUBLIC SECTION.
        METHODS instance_method.
        CLASS-METHODS static_method.
ENDCLASS.

CLASS classnew IMPLEMENTATION.
    METHOD instance_method.
        WRITE: / 'Executing instance method'.
    ENDMETHOD.

    METHOD static_method.
        WRITE: / 'Executing static method'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

* Defining object objectnew for the class classnew
DATA: objectnew TYPE REF TO classnew.

* Creating object objectnew
CREATE OBJECT objectnew.

CALL METHOD: objectnew->instance_method,
             classnew=>static_method.

" Output:
" Executing instance method
" Executing static method