*&---------------------------------------------------------------------*
*& Report  Z_OBJECTS
*&---------------------------------------------------------------------*
*& Create class object
*&---------------------------------------------------------------------*

REPORT  Z_OBJECTS.

* Class definition
CLASS classnew DEFINITION.
    PUBLIC SECTION.
    
    " Defining Method
      METHODS: methodnew.
    ENDCLASS.
    
    " Class implementation
    CLASS classnew IMPLEMENTATION.
    
    " Method Implementation
      METHOD methodnew.
         Write:/ 'Classnew public method: methodnew'.
      ENDMETHOD.
    ENDCLASS.
    
    START-OF-SELECTION.
    
    " Defining a class object
    DATA: objectnew TYPE REF TO classnew.
    
    " Creating object objectnew
    CREATE OBJECT objectnew.
    
    " Calling method using object.
    CALL METHOD: objectnew->methodnew.

* Output:
* Classnew public method: methodnew