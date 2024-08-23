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


        out->write( |1) Creating structures and structured types\n| ).

        "The following declarations are just included for demonstration purposes
        "to show how declarations of local structures and structured
        "types can look like.

        "Declaring structured type locally (flat structure)
        TYPES: BEGIN OF lty_struc,
                num1  TYPE i,
                num2  TYPE i,
                char1 TYPE c LENGTH 10,
                char2 TYPE c LENGTH 5,
                pnum  TYPE p LENGTH 8 DECIMALS 2,
            END OF lty_struc.

        "Alternatively, you could use the following syntax.
        "However, a chained statement as above provides better readability.
        TYPES BEGIN OF gs_struc_alt.
        TYPES num1    TYPE i.
        TYPES num2    TYPE i.
        TYPES char1   TYPE c LENGTH 10.
        TYPES char2   TYPE c LENGTH 5.
        TYPES pnum    TYPE p LENGTH 8 DECIMALS 2.
        TYPES END OF gs_struc_alt.

        "Creating local structures
        "a. Based on a local structured type.
        DATA ls_struc TYPE lty_struc.

        "b. Based on global types in the DDIC
        DATA ls_glo_tab TYPE zdemo_abap_flsch. "database table

        "c. Directly declaring a structure with DATA and specifying the components
        DATA: BEGIN OF ls_direct_decl,
                num1  TYPE i,
                num2  TYPE i,
                char1 TYPE c LENGTH 10,
                char2 TYPE c LENGTH 5,
                pnum  TYPE p LENGTH 8 DECIMALS 2,
            END OF ls_direct_decl.

        "d. Alternatively, you could use the following syntax.
        "However, a chained statement as above provides better readability.
        DATA BEGIN OF ls_direct_decl_alt.
        DATA num1    TYPE i.
        DATA num2    TYPE i.
        DATA char1   TYPE c LENGTH 10.
        DATA char2   TYPE c LENGTH 5.
        DATA pnum    TYPE p LENGTH 8 DECIMALS 2.
        DATA END OF ls_direct_decl_alt.

        "e. Based on structure and internal table (type)
        DATA ls_like_dobj LIKE ls_struc.
        DATA ls_like_line_of_itab LIKE LINE OF gt_tab.
        DATA ls_type_line_of_itab TYPE LINE OF string_table.

        "f. Using inline declaration.
        "Type is inferred from the right-hand structure; the content is also assigned
        DATA(struc_inl1) = ls_struc.

        "Declaring structure inline and populating it using the VALUE operator
        DATA(struc_inl2) = VALUE lty_struc( num1 = 1 num2 = 2 ).

        out->write( `No output for this section. See the code.` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Variants of structures` ) ).
        out->write( |2) Flat structure with default values\n\n| ).

        "Flat structures only contain elementary data types

        "Flat structure with default values
        DATA: BEGIN OF ls_flat,
                num1  TYPE i VALUE 1,
                num2  TYPE i VALUE 2,
                char1 TYPE c LENGTH 10 VALUE 'abcdefghij',
                char2 TYPE c LENGTH 5 VALUE 'klmno',
                pnum  TYPE p LENGTH 8 DECIMALS 2 VALUE '123.45',
            END OF ls_flat.

        out->write( data = ls_flat name = `ls_flat` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `3) Nested structure` ) ).

        "Nested structures contain at least one structure as component

        "Nested structure with default values
        DATA: BEGIN OF ls_nested_address,
                BEGIN OF name,
                title      TYPE string VALUE `Mr.`,
                first_name TYPE string VALUE `Duncan`,
                surname    TYPE string VALUE `Pea`,
                END OF name,
                BEGIN OF street,
                name   TYPE string VALUE `Vegetable Lane`,
                number TYPE string VALUE `11`,
                END OF street,
                BEGIN OF city,
                zipcode TYPE string VALUE `349875`,
                name    TYPE string VALUE `Botanica`,
                END OF city,
            END OF ls_nested_address.

        out->write( data = ls_nested_address name = `ls_nested_address` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `4) Deep structure with strings` ) ).

        "Deep structures contain at least one deep component, for
        "example, internal tables, strings.

        "Deep structure with strings and with default values.
        DATA: BEGIN OF ls_flat_address,
                name   TYPE string VALUE `Mr. Duncan Pea`,
                street TYPE string VALUE `Vegetable Lane 11`,
                city   TYPE string VALUE `349875 Botanica`,
            END OF ls_flat_address.

        out->write( data = ls_flat_address name = `ls_flat_address` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `5) Deep structure with internal table as component` ) ).

        "Structured type for nested internal table
        TYPES: BEGIN OF lty_flights,
                connid    TYPE zdemo_abap_flsch-connid,
                countryfr TYPE zdemo_abap_flsch-countryfr,
                cityfrom  TYPE zdemo_abap_flsch-cityfrom,
                airpfrom  TYPE zdemo_abap_flsch-airpfrom,
                countryto TYPE zdemo_abap_flsch-countryto,
                cityto    TYPE zdemo_abap_flsch-cityto,
                airpto    TYPE zdemo_abap_flsch-airpto,
            END OF lty_flights.

        "Creating deep structure
        DATA: BEGIN OF ls_flights,
                carrier      TYPE zdemo_abap_flsch-carrid VALUE 'LH',
                carrier_name TYPE zdemo_abap_carr-carrname VALUE 'Lufthansa',
                lt_flights   TYPE TABLE OF lty_flights WITH EMPTY KEY,
            END OF ls_flights.

        "Filling nested internal table for the output
        SELECT * 
            FROM zdemo_abap_flsch
            WHERE carrid = 'LH'
            INTO CORRESPONDING FIELDS OF TABLE @ls_flights-lt_flights
            UP TO 4 ROWS.

        out->write( data = ls_flights name = `ls_flights` ).


**********************************************************************
**********************************************************************