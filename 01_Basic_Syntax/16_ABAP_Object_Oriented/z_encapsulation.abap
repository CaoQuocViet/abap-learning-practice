*&---------------------------------------------------------------------*
*& Report  Z_ENCAPSULATION
*&---------------------------------------------------------------------*
*& Implementing Encapsulation in ABAP
*&---------------------------------------------------------------------*

REPORT  Z_ENCAPSULATION.

INTERFACE interface_new.
    METHODS: method_new.
ENDINTERFACE.

CLASS class_new1 DEFINITION.
    PUBLIC SECTION.
        INTERFACES: interface_new.
ENDCLASS.

CLASS class_new1 IMPLEMENTATION.
    METHOD interface_new~method_new.
        WRITE:/ 'Interface methodnew from classnew1 executing..'.
    ENDMETHOD.
ENDCLASS.

CLASS class_new2 DEFINITION.
    PUBLIC SECTION.
        INTERFACES: interface_new.
ENDCLASS.

CLASS class_new2 IMPLEMENTATION.
    METHOD interface_new~method_new.
        WRITE:/ 'Interface methodnew from classnew2 executing..'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: childobj1 TYPE REF TO class_new1,
      childobj2 TYPE REF TO class_new2.

CREATE OBJECT childobj1.
CREATE OBJECT childobj2.

WRITE / 'Accessing method_new1 through childobj1'.
CALL METHOD childobj1->interface_new~method_new.
ULINE.

WRITE / 'Accessing method_new2 through childobj2'.
CALL METHOD childobj2->interface_new~method_new.
ULINE.

* Output:
*---------------------------------------------------*
* Accessing method_new1 through childobj1
* Interface methodnew from classnew1 executing..
*---------------------------------------------------*
* Accessing method_new2 through childobj2
* Interface methodnew from classnew2 executing..
*---------------------------------------------------* 