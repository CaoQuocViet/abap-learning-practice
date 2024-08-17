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

        " heading: static method of ZCL_DEMO_ABAP_AUX
        out->write( zcl_demo_abap_aux=>heading( `2) Adding initial line` ) ).

        APPEND INITIAL LINE TO it_st.

        INSERT INITIAL LINE INTO TABLE it_so.

        out->write( data = it_st name = `it_st` ).
        out->write( |\n| ).
        out->write( data = it_so name = `it_so` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `3) Adding multiple lines of an internal table to another one` ) ).

        APPEND LINES OF it_so TO it_st.

        DATA it_so2 LIKE it_so.

        INSERT VALUE #( a = 3 b = 'g' c = 'h' d = 'i' ) INTO TABLE it_so2.

        INSERT VALUE #( a = 4 b = 'j' c = 'k' d = 'l' ) INTO TABLE it_so2.

        INSERT LINES OF it_so2 INTO TABLE it_so.

        out->write( data = it_st name = `it_st` ).
        out->write( |\n| ).
        out->write( data = it_so name = `it_so` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `4) Adding lines of an internal table to another one by specifying the index range.` ) ).

        APPEND LINES OF it_so FROM 2 TO 3 TO it_st.

        INSERT LINES OF it_so FROM 3 INTO TABLE it_st.

        APPEND LINES OF it_so TO 2 TO it_st.

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `5) Inserting lines of an internal table into another one at a specific position` ) ).

        INSERT VALUE #( a = 10 b = 'ggg' c = 'hhh' d = 'iii' ) INTO TABLE it_st INDEX 1.

        INSERT LINES OF it_so2 INTO it_st INDEX 2.

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `6) Adding lines using constructor expressions` ) ).

        line = VALUE #( a = 1 b = 'aaa' c = 'bbb' d = 'ccc' ).

        it_st = VALUE #( ( line ) ( a = 2 b = 'ddd' c = 'eee' d = 'fff' ) ).

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `7) Creating a new table inline and adding lines using a constructor expression` ) ).

        TYPES it_type LIKE it_st.

        DATA(it_st2) = VALUE it_type( ( a = 3       b = 'ggg'
                                        c = 'hhh'   d = 'iii' )
                                      ( a = 4       b = 'jjj'
                                        c = 'kkk'   d = 'lll') ).

        out->write( data = it_st2 name = `it_st2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `8) Adding lines using constructor expressions and keeping existing table content` ) ).

        "BASE addition: existing table content is not removed
        it_st = VALUE #( BASE it_st ( a = 5 b = 'mmm' c = 'nnn' d = 'ooo' ) 
                                    ( a = 6 b = 'ppp' c = 'qqq' d = 'rrr' ) 
                        ).

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `9) Adding lines from other internal tables using constructor expressions` ) ).

        it_st = VALUE #( BASE it_st ( LINES OF it_st2 )
                       ( a = 7 b = 'sss' c = 'ttt' d = 'uuu' ) 
                       ).

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `10) Copying table content (without constructor expression)` ) ).

        it_st = it_st2.

        out->write( data = it_st name = `it_st` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `11) CORRESPONDING Operator and MOVE-CORRESPONDING` ) ).
        out->write( |Internal table content before assignments\n\n| ).

        "Note: Before the following statements, the table content is reset
        "to this state to work with the same set of values.
        fill_itabs_for_corresponding( ).

        out->write( data = tab1 name = `tab1` ).
        out->write( |\n| ).
        out->write( data = tab2 name = `tab2` ).
        out->write( |\n| ).
        out->write( data = tab3 name = `tab3` ).
        out->write( |\n| ).
        out->write( data = tab4 name = `tab4` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Copying content from another table that has a different line type ...` ) ).

        out->write( |12) ... and deleting existing table content using the CORRESPONDING operator\n\n| ).

        tab1 = CORRESPONDING #( tab2 ).

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `13) ... and deleting existing table content using MOVE-CORRESPONDING` ) ).

        MOVE-CORRESPONDING tab2 TO tab1.

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `14) ... and keeping existing table content using the CORRESPONDING operator` ) ).

        tab1 = CORRESPONDING #( BASE ( tab1 ) tab2 ).

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `15) ... and keeping existing table content using MOVE-CORRESPONDING` ) ).

        MOVE-CORRESPONDING tab2 TO tab1 KEEPING TARGET LINES.

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `16) ... respecting component mapping` ) ).

        tab1 = CORRESPONDING #( tab2 MAPPING a = e d = f ).

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `17) ... excluding components` ) ).

        tab1 = CORRESPONDING #( tab2 EXCLUDING b ).

        out->write( data = tab1 name = `tab1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `18) ... excluding components and using MAPPING` ) ).

        " EXCEPT * means unspecified components are excluded
        tab1 = CORRESPONDING #( tab2 MAPPING d = f EXCEPT * ).

        out->write( data = tab1 name = `tab1` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `19) ... discarding duplicates` ) ).

        tab3 = CORRESPONDING #( BASE (tab3) tab4 DISCARDING DUPLICATES ).

        out->write( data = tab3 name = `tab3` ).
        out->write( |\n| ).

        fill_itabs_for_corresponding( ).

        tab3 = CORRESPONDING #( BASE (tab3) tab4 DISCARDING DUPLICATES
                                MAPPING d = f EXCEPT b).

        out->write( data = tab3 name = `tab3` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `20) Copying data from a deep internal table to another deep internal table` ) ).

        itab_nested2 = CORRESPONDING #( DEEP itab_nested1 ).

        itab_nested2 = CORRESPONDING #( DEEP BASE( itab_nested2 ) itab_nested1 ).

        MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES.

        MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES KEEPING TARGET LINES.

        out->write( `Original table content` ).
        out->write( |\n| ).
        out->write( |\n| ).
        out->write( data = itab_nested1 name = `itab_nested1` ).
        out->write( |\n| ).
        out->write( data = itab_nested2 name = `itab_nested2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `21) ... deleting existing content (CORRESPONDING operator)` ) ).

        itab_nested2 = CORRESPONDING #( DEEP itab_nested1 ).

        out->write( data = itab_nested2 name = `itab_nested2` ).
        
        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `22) ... deleting existing content (MOVE-CORRESPONDING)` ) ).

        MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES.

        out->write( data = itab_nested2 name = `itab_nested2` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `23) ... keeping existing content (CORRESPONDING operator)` ) ).

        itab_nested2 = CORRESPONDING #(DEEP BASE ( itab_nested2 ) itab_nested1 ).

        out->write( data = itab_nested2 name = `itab_nested2` ).

        fill_itabs_for_corresponding( ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `24) ... keeping existing content (MOVE-CORRESPONDING)` ) ).

        MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES KEEPING TARGET LINES.

        out->write( data = itab_nested2 name = `itab_nested2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Filling internal tables: Excursions` ) ).
        out->write( |25) Selecting multiple rows from a database table into an internal table\n\n| ).

        SELECT FROM zdemo_abap_tab1
            FIELDS key_field, char1, char2, num1, num2
            WHERE num1 > 3
            INTO TABLE @DATA(itab_select1).

        out->write( data = itab_select1 name = `itab_select1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading(  `26) Sequentially adding multiple rows from a database table to an internal table` ) ).

        DATA itab TYPE TABLE OF zdemo_abap_tab1 WITH NON-UNIQUE client key_field.

        SELECT FROM zdemo_abap_tab1
                FIELDS *
                WHERE num1 > 3
                INTO @DATA(struc_select).

                IF sy-subrc = 0.
                        "Some modifications on the read lines (capitalizing letters)
                        struc_select-char1 = to_upper( struc_select-char1 ).
                        struc_select-char2 = to_upper( struc_select-char2 ).

                        "Adding modified line to an internal table
                        APPEND struc_select TO itab.
                ENDIF.
        ENDSELECT.

        out->write( data = itab name = `itab` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `27) Adding multiple rows from a database table ` && `to an internal table that has a different line type than the ` && `database table and keeping existing table content` ) ).

        SELECT FROM zdemo_abap_tab2
                FIELDS *
                WEHRE num1 > 10
                APPENDING CORRESPONDING FIELDS OF TABLE @itab.

        out->write( data = itab name = `itab` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `28) Adding multiple rows from a database table ` && `to an internal table that has a different line type than the ` && `database table and deleting existing table content` ) ).

        SELECT FROM zdemo_abap_tab2
                FIELDS *
                WHERE num1 > 10
                INTO CORRESPONDING FIELDS OF TABLE @itab.

        out->write( data = itab name = `itab` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `29) Adding multiple rows from an internal table ` && `to an internal table using SELECT` ) ).

        SELECT key_filed, char1, char2, num1, num2
            FROM @itab AS itab_alias
            INTO TABLE @DATA(itab_clone).

        out->write( data = itab_clone name = `itab_clone` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `30) Combining data of multiple tables into an` && ` internal table using an inner join` ) ).

        "Filling table to be selected from
        itab = VALUE #( ( key_field = 500 char1 = 'uuu' char2 = 'vvv'
                          num1      = 501 num2  = 502 )
                          key_field = 600 char1 = 'www' char2 = 'xxx'
                          num1      = 601 num2  = 602 ) ).

        "SELECT list includes fields from both tables
        "If there are no equivalent entries in the first or second table, 
        "the rows are not joined.
        SELECT itab_alias1~key_field, itab_alias1~char2, zdemo_abap_tab2~numlong
                FROM @itab AS itab_alias1
                INNER JOIN zdemo_abap_tab2
                        ON itab_alias1~key_field = zdemo_abap_tab2~key_field
                INTO TABLE @DATA(join_result).

        out->write( data = join_result name = `join_result` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `31) Filling internal table ` && `using a subquery (1)` ) ).

        "A subquery is specified in the WHERE clause
        "Here, data is selected from a database table depending on
        "whether the value of a certain field is not among the 
        "values specified in parentheses.
        SELECT key_field, char1, numlong
                FROM zdemo_abap_tab2
                WHERE char1 NOT IN ( 'iii', 'mmm', 'ooo', 'qqq' )
                INTO TABLE @DATA(subquery_result1).

        out->write( data = subquery_result1 name = `subquery_result1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `32) Filling internal table ` && `using a subquery (2)` ) ).

        "A subquery using EXISTS in the WHERE clause.
        "In the example, data is selected from a database table depending
        "on the existence of data in an internal table. Only if a line
        "with a matching value of the specified field exists in both
        "database and internal table, data is read.
        SELECT key_field, numlong
                FROM zdemo_abap_tab2
                WHERE EXISTS
                        ( SELECT 'X' FROM @itab AS itab_alias2
                          WHERE key_field = zdemo_abap_tab2~key_field )
                INTO TABLE @DATA(subquery_result2).

        out->write( data = subquery_result2 name = `subquery_result2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `33) Filling an internal table from a table ` && `depending on the existence of data in another internal table ` && `using the addition FOR ALL ENTRIES` ) ).

        "In the example, data is selected from a database table depending
        "on the existence of data in an internal table. Only if a line
        "with a matching value of the specified field exists in both
        "database and internal table, data is read.
        "Ensure that the internal table from which to read is not initial.
        IF ( 0 < lines( itab ) ).
                SELECT key_field, char1, numlong
                        FROM zdemo_abap_tab2
                        FOR ALL ENTRIES IN @itab
                        WHERE key_field = @itab-key_field
                        INTO TABLE @DATA(select_result).
        ENDIF.

        out->write( data = select_result name = `select_result` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `34) Adding content from a database to internal` && ` table by using alias names in the SELECT list` ) ).

        DATA itab2 TYPE TABLE OF zdemo_abap_tab2 WITH EMPTY KEY.

        "Specifying alias names can help fill an existing internal
        "table that has not a matching line type to the database table.
        "Here, two fields are specified with an alias name to match the
        "names of components contained in the existing internal table.
        "The individual types of the fields match, too.
        SELECT key_field, char2 AS char1, num2 AS num1
                FROM zdemo_abap_tab1
                INTO CORRESPONDING FIELDS OF TABLE @itab2 UP TO 3 ROWS.

        out->write( data = itab2 name = `itab2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `35) FILTER: Filtering internal table by condition` ) ).

        "This section covers multiple examples demonstrating the 
        "syntactical variety of the FILTER operator.

        TYPES: BEGIN OF fi_str
                        a TYPE i,
                        b TYPE c LENGTH 3,
                        c TYPE c LENGTH 3,
        END OF fi_str.

        "basic form, condition created with single values
        "itab must have at least one sorted key or one hash key used for access.
        "This variant of the filter operator is not possible for an internal table itab without a sorted key or hash key.
        DATA fi_tab1 TYPE SORTED TABLE OF fi_str WITH NON-UNIQUE KEY a.
        DATA fi_tab2 TYPE STANDARD TABLE OF fi_str WITH NON-UNIQUE SORTED KEY sec_key COMPONENTS a.
        DATA fi_tab3 TYPE HASHED TABLE OF fi_str WITH UNIQUE KEY a.

        "FIlling internal tables
        fi_tab1 = VALUE #( ( a = 1 b = 'aaa' c = 'aaa' )
                           ( a = 2 b = 'bbb' c = 'bbb' )
                           ( a = 3 b = 'ccc' c = 'ccc' )
                           ( a = 4 b = 'ddd' c = 'ddd' )
                           ( a = 5 b = 'eee' c = 'eee' ) ).

        fi_tab2 = fi_tab1.
        fi_tab3 = fi_tab1.

        "The lines meeting the condition are respected.
        "Note: The source table must have at least one sorted or hashed key.
        "Here, the primary key is used
        DATA(f1) = FILTER #( fi_tab1 WHERE a >= 3).

        out->write( data = f1 name = `f1` ).
        out->write( |\n| ).

        "USING KEY primary_key explicitly specified; same as above
        DATA(f2) = FILTER #( fi_tab1 USING KEY primary_key WHERE a >= 3).

        out->write( data = f2 name = `f2` ).
        out->write( |\n| ).

        "EXCEPT addition
        DATA(f3) = FILTER #( fi_tab1 EXCEPT WHERE a >= 3).

        out->write( data = f3 name = `f3` ).
        out->write( |\n| ).

        DATA(f4) = FILTER #( fi_tab1 EXCEPT USING KEY primary_key WHERE a >= 3).

        out->write( data = f4 name = `f4` ).
        out->write( |\n| ).

        "Secondary table key specified after USING KEY
        DATA(f5) = FILTER #( fi_tab2 USING KEY sec_key WHERE a >= 4 ).

        out->write( data = f5 name = `f5` ).
        out->write( |\n| ).

        DATA(f6) = FILTER #( fi_tab2 EXCEPT USING KEY sec_key WHERE a >= 3 ).

        out->write( data = f6 name = `f6` ).
        out->write( |\n| ).

        "Note: In case of a hash key, exactly one comparison expression for each key
        "component is allowed; only = as comparison operator possible.
        DATA(f7) = FILTER #( fi_tab3 WHERE a = 3 ).

        out->write( data = f7 name = `f7` ).
        out->write( |\n| ).

        "Using a filter table
        "In the WHERE condition, the columns of source and filter table are compared.
        "Those lines in the source table are used for which at least one line in the
        "filter table meets the condition. EXCEPT and USING KEY are also possible.

        "Declaring and filling filter tables
        DATA filter_tab1 TYPE SORTED TABLE OF i
                WITH NON-UNIQUE KEY table_line.

        DATA filter_tab2 TYPE STANDARD TABLE OF i
                WITH EMPTY KEY
                WITH UNIQUE SORTED KEY line COMPONENTS table_line.

        filter_tab1 = VALUE #( ( 3 ) ( 5 ) ).
        filter_tab2 = filter_tab1.
 
        DATA(f8) = FILTER #( fi_tab1 IN filter_tab1 WHERE a = table_line ).

        out->write( data = f8 name = `f8` ).
        out->write( |\n| ).

        "EXECPT addition
        DATA(f9) = FILTER #( fi_tab1 EXECPT IN filter_tab1 WHERE a = table_line ).

        out->write( data = f9 name = `f9` ).
        out->write( |\n| ).

        "USING KEY is specified for the filter table
        DATA(f10) = FILTER #( fi_tab2 IN filter_tab2 USING KEY line WHERE a = table_line ).

        out->write( data = f10 name = `f10` ).
        out->write( |\n| ).

        "USING KEY is specified for the source table, including EXCEPT
        DATA(f11) = FILTER #( fi_tab2 USING KEY sec_key EXCEPT IN filter_tab2 WHERE a = table_line ).

        out->write( data = f11 name = `f11` ).


**********************************************************************
**********************************************************************