*&---------------------------------------------------------------------*
*& Report  Z_INTERFACES
*&---------------------------------------------------------------------*
*& Implementing Interfaces
*&---------------------------------------------------------------------*

REPORT  Z_INTERFACES.

* Interface Definition
INTERFACE interface_new.
    DATA: A TYPE I, B TYPE I.
    METHODS: method_new.
ENDINTERFACE.

CLASS class_new DEFINITION.
    PUBLIC SECTION.
        INTERFACES: interface_new.
ENDCLASS.

CLASS class_new IMPLEMENTATION.
    METHOD interface_new~method_new.
        DATA result TYPE I.
        result = interface_new~A + interface_new~B.
        WRITE: /'Addition of A and B:', result.
    ENDMETHOD.
ENDCLASS.

CLASS class_new2 DEFINITION.
    PUBLIC SECTION.
        INTERFACES: interface_new.
ENDCLASS.

CLASS class_new2 IMPLEMENTATION.
    METHOD interface_new~method_new.
        DATA result TYPE I.
        result = interface_new~A * interface_new~B.
        WRITE: /'Multiplication of A and B:', result.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: childobj1 TYPE REF TO class_new.
CREATE OBJECT childobj1.

childobj1->interface_new~A = 10.
childobj1->interface_new~B = 20.

CALL METHOD: childobj1->interface_new~method_new.
ULINE.

DATA: childobj2 TYPE REF TO class_new2.
CREATE OBJECT childobj2.

childobj2->interface_new~A = 10.
childobj2->interface_new~B = 20.

CALL METHOD: childobj2->interface_new~method_new.
ULINE.
 
" Output:
" Addition of A and B:          30
" Multiplication of A and B:            200