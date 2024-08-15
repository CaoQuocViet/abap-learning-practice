CLASS ZCl_DEMO_ABAP_INTERNAL_TABLE DEFINITION
    PUBLIC
    FINAL
    CREATE PUBLIC .

    PUBLIC SECTION.
        INTERFACES: if_oo_adt_classrun.
        CLASS-METHODS:  class_constructor.

    PRIVATE SECTION.
    TYPES:
        BEGIN OF struc1,
            a TYPE i,
            b TYPE c LENGTH 3,
            c TYPE c LENGTH 3,
            d TYPE c LENGTH 3,
        END OF struc1,

        BEGIN OF struc2,
            a TYPE i,
            b TYPE c LENGTH 3,
            e TYPE c LENGTH 3,
            f TYPE string,
        END OF struc2,

        BEGIN OF l_type1,
            key_field TYPE i,
            num1 TYPE i,
            num2 TYPE i,
        END OF l_type1,

        BEGIN OF l_type2,
            key_field TYPE i,
            num1 TYPE i,
            num2 TYPE i,
        END OF l_type2,

        BEGIN OF nested1,
            key_field TYPE i,
            child1 TYPE c LENGTH 10,
            tab TYPE STANDARD TABLE OF l_type2 WITH EMPTY KEY,
        END OF nested1.

        BEGIN OF nested2,
            key_field TYPE i,
            child1 TYPE c LENGTH 10,
            tab TYPE STANDARD TABLE OF l_type1 WITH EMPTY KEY,
        END OF nested2,

        ty_nested1 TYPE STANDARD TABLE OF nested1 WITH EMPTY KEY,
        ty_nested2 TYPE STANDARD TABLE OF nested2 WITH EMPTY KEY.

        CLASS-DATA:
            itab_nested1 TYPE ty_nested1,
            itab_nested2 TYPE ty_nested2,

            tab1         TYPE TABLE OF struc1 WITH NON-UNIQUE KEY a,
            tab2         TYPE TABLE OF struc2 WITH NON-UNIQUE KEY a,
            tab3         TYPE SORTED TABLE OF struc1 WITH ULINE KEY a,
            tab4         TYPE SORTED TABLE OF struc2 WITH ULINE KEY a.

        CLASS-METHODS:
            fill_dbtabs,
            fill_itabs_for_corresponding.
ENDCLASS.




CLASS ZCl_DEMO_ABAP_INTERNAL_TABLE IMPLEMENTATION.

    METHOD class_constructor.
        fill_dbtabs( ).
    ENDMETHOD.


    METHOD fill_dbtabs.
        DELETE FROM zdemo_abap_tab1.
        DELETE FROM zdemo_abap_tab2.

        MODIFY zdemo_abap_tab1 FROM TABLE @( VALUE #(
            ( key_field = 100 char1 = 'aaa' char2 = 'bbb' num1 = 1 num2 = 2 )
            ( key_field = 200 char1 = 'ccc' char2 = 'ddd' num1 = 3 num2 = 4 )
            ( key_field = 300 char1 = 'eee' char2 = 'fff' num1 = 5 num2 = 6 )
            ( key_field = 400 char1 = 'ggg' char2 = 'hhh' num1 = 7 num2 = 8 ) ) ).
        MODIFY zdemo_abap_tab2 FROM TABLE @( VALUE #(
            ( key_field = 500 char1 = 'iii' num1 = 10 numlong = 1000 )
            ( key_field = 600 char1 = 'kkk' num1 = 12 numlong = 2000 )
            ( key_field = 700 char1 = 'mmm' num1 = 14 numlong = 3000 )
            ( key_field = 800 char1 = 'ooo' num1 = 15 numlong = 4000 ) ) ).
    ENDMETHOD.


    METHOD fill_itabs_for_corresponding.
        tab1 = VALUE #( ( a = 1 b = 'aaa' c = 'aaa' d = 'A' )
                        ( a = 2 b = 'bbb' c = 'bbb' d = 'B' ) ).
    
        tab2 = VALUE #( ( a = 3 b = 'ccc' e = 'ccc' f = `CCC` )
                        ( a = 4 b = 'ddd' e = 'ddd' f = `DDD` ) ).
    
        tab3 = VALUE #( ( LINES OF tab1 ) ).
    
        tab4 = VALUE #( ( a = 1 b = 'xxx' e = 'yyy' f = `ZZZ` )
                        ( LINES OF tab2 ) ).
    
        itab_nested1 = VALUE #(
            ( key_field = 1 char1 = 'aaa'
                tab       = VALUE #( ( key_field = 1 num1 = 2 num2 = 3 )
                                    ( key_field = 2 num1 = 3 num2 = 4 )
                                    ( key_field = 3 num1 = 4 num2 = 5 ) ) )
            ( key_field = 2 char1 = 'bbb'
                tab       = VALUE #( ( key_field = 4 num1 = 5 num2 = 6 )
                                    ( key_field = 5 num1 = 6 num2 = 7 )
                                    ( key_field = 6 num1 = 7 num2 = 8 ) ) ) ).
    
        itab_nested2 = VALUE #(
        ( key_field = 99  char2 = 'yyy' tab = VALUE #(
                                                        ( key_field = 10    char1 = 'aaa'
                                                            char2     = 'bbb' num1  = 100  num2 = 200 )
                                                        ( key_field = 20    char1 = 'ccc'
                                                            char2     = 'ddd' num1  = 300  num2 = 400 )
                                                        ( key_field = 30    char1 = 'eee'
                                                            char2     = 'fff' num1  = 500  num2 = 600 ) ) )
        ( key_field = 100 char2 = 'zzz' tab = VALUE #(
                                                        ( key_field = 40    char1 = 'ggg'
                                                            char2     = 'hhh' num1  = 700  num2 = 800 )
                                                        ( key_field = 50    char1 = 'iii'
                                                            char2     = 'jjj' num1  = 900  num2 = 1000 )
                                                        ( key_field = 60    char1 = 'kkk'
                                                            char2     = 'lll' num1  = 1100 num2 = 1200 ) ) ) ).
    ENDMETHOD.


    METHOD if_oo_adt_classrun~main.
        out->write( |ABAP Cheat Sheet Example: Internal Table\n\n| ).
        out->write( |Filling and Copying Internal Table Content\n| ).
        out->write( |1) Adding single lines using APPEND/INSERT\n\n| ).

        DATA it_st TYPE TABLE OF struc1 WITH NON-UNIQUE KEY a.
        DATA it_so TYPE SORTED TABLE OF struc1 WITH UNIQUE KEY a.

        APPEND VALUE #(a = 1 b = 'aaa' c = 'bbb' d = 'ccc' ) TO it_st.

        DATA(line) = VALUE struc1 (a = 2 b = 'd' c = 'e' d = 'f').

        APPEND line TO it_so.

        INSERT VALUE #( a = 1 b = 'a' c = 'b' d = 'c' ) INTO TABLE it_so.

        out->write( data = it_st name = `it_st` ).
        out->write( |\n| ).
        out->write( data = it_so name = `it_so` ).


**********************************************************************
**********************************************************************

