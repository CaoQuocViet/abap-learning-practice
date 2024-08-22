"! <p class="shorttext synchronized">ABAP cheat sheet: Structures</p>
"! Example to demonstrate working with structures.<br>Choose F9 in ADT to run the class.
CLASS zcl_demo_abap_structures DEFINITION
    PUBLIC FINAL CREATE PUBLIC .

    PUBLIC SECTION.
        INTERFACES: if_oo_adt_classrun.

        CLASS-METHODS: class_constructor.
        
    PROTECTED SECTION.

    PRIVATE SECTION.
        "Creating structured data types
        TYPES: "Flat structure
            BEGIN OF gty_struc,
                num1    TYPE i,
                num2    TYPE i,
                char1   TYPE c LENGTH 10,
                char2   TYPE c LENGTH 5,
                pnum    TYPE p LENGTH 8 DECIMALS 2,
            END OF gty_struc,

            "Structures within deep structure
            BEGIN OF line1,
                col1    TYPE i,
                col2    TYPE i,
            END OF line1,

            BEGIN OF line2,
                col2    TYPE i,
                col3    TYPE i,
                col4    TYPE i,
            END OF line2,

        CLASS-DATA:
        "Flat structure
        gs_struc TYPE gty_struc,

        "Deep structure 1
        BEGIN OF gs_deep1,
            comp TYPE c LENGTH 1 VALUE 'W',
            BEGIN OF substruc,
                comp1 TYPE c LENGTH 1 VALUE 'X',
                BEGIN OF comp2,
                    col1 TYPE c LENGTH 1 VALUE 'Y',
                    col2 TYPE c LENGTH 1 VALUE 'Z',
                END OF comp2,
            END OF substruc,
            itab TYPE TABLE OF line1 WITH EMPTY KEY,
        END OF gs_deep1,

        "Deep structure 2
        BEGIN OF gs_deep2,
            BEGIN OF substruc,
                comp1 TYPE string,
                comp2 TYPE string,
                comp3 TYPE string,
            END OF substruc,
            itab TYPE TABLE OF line2 WITH EMPTY KEY,
            comp4 TYPE i,
        END OF gs_deep2.

        "Creating internal table for displaying purposes
        gs_tab TYPE STANDARD TABLE OF zdemo_abap_tab1
            WITH NON-UNIQUE KEY key_field.

        CLASS-METHODS:
            initialize_dbtabs,
            fill_deep_structures,
            select_from_dbtab.
ENDCLASS.



CLASS zcl_demo_abap_structures IMPLEMENTATION.
    METHOD class_constructor .
        initialize_dbtabs( ).
        fill_deep_structures( ).
        zcl_demo_abap_aux=>fill_dbtabs( ).
    ENDMETHOD.

    METHOD fill_deep_structures.
        "Clearing all content of gs_deep2
        CLEAR gs_deep2.

        "Filling nested tables in deep structures
        gs_deep2-substruc = VALUE #( comp1 = 'aaa'
                                     comp2 = 'bbb'
                                     comp3 = 'ccc' ).

        gs_deep1-itab = VALUE #( ( col1 = 111 col2 = 222 )
                                 ( col1 = 333 col2 = 444 ) ).

        gs_deep2-itab = VALUE #( ( col2 = 1 col3 = 2 col4 = 3 )
                                 ( col2 = 4 col3 = 5 col4 = 6 )
                                 ( col2 = 7 col3 = 8 col4 = 9 ) ).

        "Filling individual components that is not shared by both structures
        gs_deep2-comp4 = 999.
    ENDMETHOD.

    METHOD if_oo_adt_classrun~main.

        out->write( |ABAP Cheat Sheet Example: Structures\n\n| ).


**********************************************************************
**********************************************************************