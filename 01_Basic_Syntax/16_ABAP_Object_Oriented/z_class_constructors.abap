*&---------------------------------------------------------------------*
*& Report  Z_CONSTRUCTORS
*&---------------------------------------------------------------------*
*& Explain how the constructor is being triggered
*&---------------------------------------------------------------------*

REPORT  Z_CONSTRUCTORS.

CLASS classnew DEFINITION.
    PUBLIC SECTION.
        METHODS constructor.

        CLASS-METHODS class_constructor.
ENDCLASS.

CLASS classnew IMPLEMENTATION.
    METHOD constructor.
        WRITE: / 'Instance Constructor is being triggered'.
    ENDMETHOD.

    METHOD class_constructor.
        WRITE: / 'Class Constructor is being triggered'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: objectnew TYPE REF TO classnew.

CREATE OBJECT objectnew.

" Output:
" Instance Constructor is being triggered
" Class Constructor is being triggered