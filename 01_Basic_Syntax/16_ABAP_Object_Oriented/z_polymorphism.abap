*&---------------------------------------------------------------------*
*& Report  Z_POLYMORPHISM
*&---------------------------------------------------------------------*
*& Implementing Polymorphism in ABAP
*&---------------------------------------------------------------------*

REPORT  Z_POLYMORPHISM.

CLASS parent_class DEFINITION.
    PUBLIC SECTION.
        METHODS: method_new.
ENDCLASS.

CLASS parent_class IMPLEMENTATION.
    METHOD method_new.
        WRITE:/ 'Parent class method_new executing...'.
    ENDMETHOD.
ENDCLASS.

CLASS child_class1 DEFINITION INHERITING FROM parent_class.
    PUBLIC SECTION.
        METHODS: method_new REDEFINITION.
ENDCLASS.

CLASS child_class1 IMPLEMENTATION.
    METHOD method_new.
        WRITE:/ 'Child class1 method_new executing...'.
    ENDMETHOD.
ENDCLASS.

CLASS child_class2 DEFINITION INHERITING FROM parent_class.
    PUBLIC SECTION.
        METHODS: method_new REDEFINITION.
ENDCLASS.

CLASS child_class2 IMPLEMENTATION.
    METHOD method_new.
        WRITE:/ 'Child class2 method_new executing...'.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: parent_obj TYPE REF TO parent_class,
      child_obj1 TYPE REF TO child_class1,
      child_obj2 TYPE REF TO child_class2.

CREATE OBJECT parent_obj.
CREATE OBJECT child_obj1.
CREATE OBJECT child_obj2.

CALL METHOD parent_obj->method_new.
ULINE.

CALL METHOD child_obj1->method_new.
ULINE.

CALL METHOD child_obj2->method_new.
ULINE.

* Output:
*---------------------------------------------------*
* Parent class method_new executing...
*---------------------------------------------------*
* Child class1 method_new executing...
*---------------------------------------------------*
* Child class2 method_new executing...
*---------------------------------------------------*