"! <p class="shorttext synchronized">ABAP cheat sheet: ABAP SQL</p>
"! Example to demonstrate ABAP SQL.<br>Choose F9 in ADT to run the class.
CLASS zcl_demo_abap_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    CLASS-METHODS:
      class_constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS: select_from_dbtab.

    CLASS-DATA:
      struct   TYPE zdemo_abap_flsch,
      itab     TYPE TABLE OF zdemo_abap_flsch,
      itab_res TYPE TABLE OF zdemo_abap_carr.

ENDCLASS.



CLASS zcl_demo_abap_sql IMPLEMENTATION.


  METHOD class_constructor.
    "Filling demo database tables.
    zcl_demo_abap_aux=>fill_dbtabs( ).
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    out->write( |ABAP Cheat Sheet Example: ABAP SQL\n\n| ).
    out->write( |Using SELECT for multiple purposes\n| ).
    out->write( |1) Reading a single row from database table into a structure\n\n| ).

    "Note that, although it is optional, a WHERE clause should always be
    "specified for performance reasons and to restrict the read result.
    "In the following SELECT statements, a simple WHERE condition is
    "used to limit the number of found results.

    "Reading all fields

    "Reading into existing structure