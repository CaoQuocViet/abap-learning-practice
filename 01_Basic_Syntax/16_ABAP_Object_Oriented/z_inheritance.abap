*&---------------------------------------------------------------------*
*& Report  Z_INHERITANCE
*&---------------------------------------------------------------------*
*& Implementing Inheritance in ABAP
*&---------------------------------------------------------------------*

REPORT  Z_INHERITANCE.

CLASS parent_class DEFINITION.
    PUBLIC SECTION.
        DATA pub_var(35) TYPE C VALUE 'PArent class public variable'.
        METHODS: parent_method.
    
    PROTECTED SECTION.
        DATA pro_var(35) TYPE C VALUE 'Parent class protected variable'.

    PRIVATE SECTION.
        DATA pri_var(35) TYPE C VALUE 'Parent class private variable'.
ENDCLASS.

CLASS parent_class IMPLEMENTATION.
    METHOD parent_method.
        WRITE: / pub_var.
        WRITE: / pro_var.
        WRITE: / pri_var.
    ENDMETHOD.
ENDCLASS.

CLASS child_class DEFINITION INHERITING FROM parent_class.
    PUBLIC SECTION.
        METHODS: child_method.
ENDCLASS.

CLASS child_class IMPLEMENTATION.
    METHOD child_method.
        WRITE: / pub_var.
        WRITE: / pro_var.
        " WRITE: / pri_var. --> Error
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: parent_obj TYPE REF TO parent_class.
CREATE OBJECT parent_obj.

WRITE: / 'Accessing parent class method...'.
CALL METHOD parent_obj->parent_method.
SKIP 2.

DATA: child_obj TYPE REF TO child_class.
CREATE OBJECT child_obj.

WRITE: / 'Accessing child class method...'.
CALL METHOD child_obj->child_method.

" Output:
" Accessing parent class method...
" PArent class public variable
" Parent class protected variable
" Parent class private variable


" Accessing child class method...
" PArent class public variable
" Parent class protected variable