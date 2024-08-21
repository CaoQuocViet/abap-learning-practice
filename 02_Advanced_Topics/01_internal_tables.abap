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


        out->write( zcl_demo_abap_aux=>heading( `36) Inserting data into an internal table ` && `using a COLLECT statement` ) ).

        "Internale table to work with
        DATA itab_num TYPE SORTED TABLE OF l_type2
                WITH UNIQUE KEY key_field.

        itab_num = VALUE #( ( key_field = 1 num1 = 10 num2 = 20 )
                            ( key_field = 2 num1 = 30 num2 = 40 )
                            ( key_field = 3 num1 = 50 num2 = 60 ) ).

        "Values of numeric components are added to the
        "corresponding values in an internal table
        COLLECT VALUE l_type2( key_field = 1 num1 = 10 num2 = 20 )
                INTO itab_num.

        out->write( data = itab_num name = `itab_num` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `37) Reading from internal tables` ) ).

        "Filling internal tables
        it_st = VALUE #( ( a = 1 b = 'aaa' c = 'bbb' d = 'ccc' )
                         ( a = 2 b = 'ddd' c = 'eee' d = 'fff' )
                         ( a = 3 b = 'ggg' c = 'hhh' d = 'iii' ) ).

        "Declaring demo sorted/hashed tables having primary and
        "secondary keys as well as alias names defined
        DATA it_so_sec TYPE SORTED TABLE OF struc1
                WITH NON-UNIQUE KEY primary_key ALIAS pk COMPONENTS a
                WITH NON-UNIQUE SORTED KEY sec_key ALIAS sk COMPONENTS b.

        DATA it_ha_sec TYPE HASHED TABLE OF struc1
                WITH UNIQUE KEY primary_key ALIAS pkh COMPONENTS A
                WITH NON-UNIQUE SORTED KEY sec_key_h ALIAS skh COMPONENTS b.

        "Filling internal table
        it_so_sec = VALUE #( ( a = 1 b = 'bbb' c = '###' d = '###' )
                             ( a = 2 b = 'ddd' c = '###' d = '###' )
                             ( a = 3 b = 'ggg' c = '###' d = '###' )
                             ( a = 4 b = 'hhh' c = '###' d = '###' ) ).

        "Filling internal table with the content above
        it_ha_sec = it_so_sec.

        out->write( `Original table content` ).
        out->write( |\n| ).
        out->write( |\n| ).
        put->write( data = it_so_sec name = `it_so_sec` ).
        out->write( |\n| ).
        out->write( data = it_ha_sec name = `it_ha_sec` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `38) Reading a single line into target area` ) ).

        "The examples anticipate the reading of a line by index since the
        "syntax requires to specify the reading via index or key. Both
        "inline declarations and existing target areas are demonstrated.

        "Work area
        READ TABLE it_so_sec INTO DATA(wa1) INDEX 1.
        DATA wa2 LIKE LINE OF it_so_sec.

        "The addition TRANSPORTING specifies which components are to be
        "respected for the copying. If it is not specified, all components
        "are respected.
        READ TABLE it_so_sec INTO wa2 INDEX 2 TRANSPORTING a b c.

        "Field symbol
        READ TABLE it_so_sec ASSIGNING FIELD-SYMBOL(<fs1>) INDEX 3.

        FIELD-SYMBOLS <fs2> LIKE LINE OF it_so_sec.
        READ TABLE it_st ASSIGNING <fs2> INDEX 1.

        "Data reference variable
        READ TABLE it_so_sec REFERENCE INTO DATA(dref1) INDEX 4.

        DATA dref2 LIKE REF TO wa2.
        READ TABLE it_so_sec REFERENCE INTO dref2 INDEX 2.

        out->write( data = wa1 name = `wa1` ).
        out->write( |\n| ).
        out->write( data = wa2 name = `wa2` ).
        out->write( |\n| ).
        out->write( data = <fs1> name = `<fs1>` ).
        out->write( |\n| ).
        out->write( data = <fs2> name = `<fs2>` ).
        out->write( |\n| ).
        out->write( data = dref1->* name = `dref1->*` ).
        out->write( |\n| ).
        out->write( data = dref2->* name = `dref2->*` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Reading a single line via index ...` ) ).
        out->write( |39) ... using READ TABLE\n\n| ).

        "Primary table index used implicitly
        READ TABLE it_so_sec INTO DATA(wa3) INDEX 1.

        "Primary table index used implicitly; result here: same as above
        READ TABLE it_so_sec INTO DATA(wa4) INDEX 1 USING KEY primary_key.

        "Primary table key alias; result here: same as above
        READ TABLE it_so_sec INTO DATA(wa5) INDEX 1 USIGN KEY pk.

        "Secondary table key; secondary table index used
        READ TABLE it_so_sec INTO DATA(wa6) INDEX 1 USING KEY sec_key.

        "Secondary table key alias; secondary table index used
        READ TABLE it_so_sec INTO DATA(wa7) INDEX 1 USING KEY sk.

        "Index access for hashed tables using secondary table index
        READ TABLE it_ha_sec INTO DATA(wa8) INDEX 2 USING KEY sec_key_h.

        out->write( data = wa3 name = `wa3` ).
        out->write( |\n| ).
        out->write( data = wa4 name = `wa4` ).
        out->write( |\n| ).
        out->write( data = wa5 name = `wa5` ).
        out->write( |\n| ).
        out->write( data = wa6 name = `wa6` ).
        out->write( |\n| ).
        out->write( data = wa7 name = `wa7` ).
        out->write( |\n| ).
        out->write( data = wa8 name = `wa8` ).


**********************************************************************
**********************************************************************

        out->write( zcl_demo_abap_aux=>heading( `40) ... table expressions (1)` ) ).

        "Reading via index; primary table index is used implicitly
        DATA(lv1) = it_so_sec[ 2 ].

        "Note: A line that is not found results in a runtime error
        DATA(idx) = 10.

        TRY
                DATA(lv2) = it_so_sec[idx].
                CATCH cx_sy_itab_line_not_found.
                        DATA(error) = |Line with index { idx } does not exist.|.
        ENDTRY.

        "Reading via index and specifying the table index (via the key)
        "to be read from
        DATA(lv3) = it_so_sec[ KEY primary_key INDEX 1 ].

        DATA(lv4) = it_so_sec[ KEY sec_key INDEX 4 ].

        "Hashed table example (secondary table index)
        DATA(lv5) = it_ha_sec[ KEY sec_key_h INDEX 3 ].

        out->write( data = lv1 name = `lv1` ).
        out->write( |\n| ).

        IF lv2 IS NOT INITIAL.
                out->write( data = lv2 name = `lv2` ).
                out->write( |\n| ).
        ENDIF.

        IF error IS NOT INITIAL.
                out->write( data = error name = `error` ).
                out->write( |\n| ).
        ENDIF.
          
        out->write( data = lv3 name = `lv3` ).
        out->write( |\n| ).
        out->write( data = lv4 name = `lv4` ).
        out->write( |\n| ).
        out->write( data = lv5 name = `lv5` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `41) ... table expressions (2)` ) ).

        "Copying a table line via table expressions and embedding in
        "a constructor expression
        DATA(lv6) = VALUE #(it_so_sec[ 2 ]).

        "Reading iton data reference variable using the REF operator
        DATA(dref3) = REF #( it_so_sec[ 4 ] ).

        "OPTIONAL/DEFAULT additions: An unsuccessful reading operation
        "deos not raise line in case of an unsuccessful reading operation
        DATA(lv7) = VALUE #(it_so_sec[ 10 ] OPTIONAL ).

        DATA(lv8) = VALUE #(it_so_sec[ 10 ] DEFAULT it_so_sec[ 1 ] ).

        out->write( data = lv6 name = `lv6` ).
        out->write( |\n| ).
        out->write( data = dref3->* name = `dref3->*` ).
        out->write( |\n| ).
        out->write( data = lv7 name = `lv7` ).
        out->write( |\n| ).
        out->write( data = lv8 name = `lv8` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Reading a single line via table keys ...` ) ).
        out->write( |42) ... using READ TABLE (1)\n| ).

        "Primary table key (COMPONENTS addition is optional)
        READ TABLE it_so_sec INTO DATAA(wa9)
                WITH TABLE KEY primary_key COMPONENTS a = 1.

        READ TABLE it_so_sec INTO DATA(wa10) WITH TABLE KEY a = 2.

        "Primary table key alias
        READ TABLE it_so_sec INTO DATAA(wa11)
                WITH TABLE KEY pk COMPONENTS a = 3.

        "Secondary table key
        READ TABEL it_so_sec INTO DATAA(wa12)
                WITH TABLE KEY sec_key COMPONENTS b = 'hhh'.

        "Secondary table key alias
        READ TABLE it_so_sec INTO DATA(wa13)
                WITH TABLE KEY sk COMPONENTS b = 'ggg'.

        out->write( data = wa9 name = `wa9` ).
        out->write( |\n| ).
        out->write( data = wa10 name = `wa10` ).
        out->write( |\n| ).
        out->write( data = wa11 name = `wa11` ).
        out->write( |\n| ).
        out->write( data = wa12 name = `wa12` ).
        out->write( |\n| ).
        out->write( data = wa13 name = `wa13` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `43) ... using READ TABLE (2)` ) ).

        "Reading a line based on keys specified in a work area
        "Here, the work area contains primary and secondary key values.
        "The line type is compatible to the internal table.
        DATA(pr_keys) = VALUE struc1( a = 2 ).

        DATA(sec_keys) = VALUE struc1( b = 'ggg' ).

        "Primary table key is used implicitly
        READ TABLE it_so_sec  FROM pr_keys INTO DATA(wa14).

        "If USING KEY is not specified, the primary table key is used.
        "If it is used, the specified table key is used.
        "Secondary table key
        READ TABLE it_so_sec FROM sec_keys
                USING KEY sec_key INTO DATA(wa15).

        "Primary table key; result: same as wa14
        READ TABLE it_so_sec FROM pr_keys
                USING KEY primary_key INTO DATA(wa16).

        out->write( data = wa14 name = `wa14` ).
        out->write( |\n| ).
        out->write( data = wa15 name = `wa15` ).
        out->write( |\n| ).
        out->write( data = wa16 name = `wa16` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `44) ... using table expressions` ) ).
        "Primary table key (COMPONENTS addition is optional)
        DATA(lv9) = it_so_sec[ KEY primary_key COMPONENTS a = 1 ].

        DATA(lv10) = it_so_sec[ KEY primary_key a = 2 ].

        DATA(lv11) = it_so_sec[ KEY pk COMPONENTS a = 3 ]. "Alias

        "Secondary table key (COMPONENTS mandatory)
        DATA(lv12) = it_so_sec[ KEY sec_key COMPONENTS b = 'hhh' ].

        DATA(lv13) = it_so_sec[ KEY sk b = 'ggg' ]. "Alias

        out->write( data = lv9 name = `lv9` ).
        out->write( |\n| ).
        out->write( data = lv10 name = `lv10` ).
        out->write( |\n| ).
        out->write( data = lv11 name = `lv11` ).
        out->write( |\n| ).
        out->write( data = lv12 name = `lv12` ).
        out->write( |\n| ).
        out->write( data = lv13 name = `lv13` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `45) Reading a single line via free key` ) ).

        "Note: If there a multiple matching entries, the first found
        "is returned.
        READ TABLE it_so_sec INTO DATA(wa17) WITH KEY c = '###'.

        DATA(lv14) = it_so_sec[ c = '###' ].

        out->write( data = wa17 name = `wa17` ).
        out->write( |\n| ).
        out->write( data = lv14 name = `lv14` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `46) Excursion: Addressing individual components` ) ).
        "Addressing a component using the component selector
        DATA(comp1) = it_so_sec[ 1 ]-b.

        READ TABLE it_so_sec ASSIGNING FIELD-SYMBOL(<fs3>) INDEX 2.

        DATA(comp2) = <fs3>-c.

        READ TABLE it_so_sec REFERENCE INTO DATA(dref4) INDEX 3.

        DATA(comp3) = dref4->*-a.

        "Same effect as above but less to write
        DATA(comp4) = dref4->b.

        out->write( data = comp1 name = `comp1` ).
        out->write( |\n| ).
        out->write( data = comp2 name = `comp2` ).
        out->write( |\n| ).
        out->write( data = comp3 name = `comp3` ).
        out->write( |\n| ).
        out->write( data = comp4 name = `comp4` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `47) Checking if a line exists in an internal table` ) ).

        "Defining the key
        DATA(key) = 2.

        "Internal table functions
        IF line_exists(it_so_sec[ a = key1 ] )
                out->write( |Line with key { key1 } exists.| ).
        ELSE.
                out->write( |Line with key { key1 } does not exist.| ).
        ENDIF.

        out->write( |\n| ).

        "Alternative using READ TABLE (sy-subrc is checked)
        "When using the addition TRANSPORTING NO FIELDS, no field values
        "are read. Only the system fields are filled.
        READ TABLE it_so_sec WITH KEY a = key1 TRANSPORTING NO FIELDS.

        IF sy-subrc = 0.
                out->write( |Line with key { key1 } exists.| ).
        ELSE.
                out->write( |Line with key { key1 } does not exist.| ).
        ENDIF.


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `48) Checking the index of a ` && `specific line` ) ).

        DATA(key2) = 4.

        DATA(idx_of_line1) = line_index( it_so_sec[ a = key2 ] ).

        DATA(key3) = 10.

        DATA(idx_of_line2) = line_index( it_so_sec[ a = key3 ] ).

        "Alternative using READ TABLE
        "The table index is written to the sy-tabix system field
        READ TABLE it_so_sec WITH KEY a = key2 TRANSPORTING NO FIELDS.

        IF sy-subrc = 0.
                DATA(tab_idx1) = sy-tabix.
        ENDIF.
        
        READ TABLE it_so_sec WITH KEY a = key3 TRANSPORTING NO FIELDS.
          
        IF sy-subrc = 0.
                DATA(tab_idx2) = sy-tabix.
        ENDIF.

        IF idx_of_line1 <> 0.
                out->write( |Index of line with key { key2 }: { idx_of_line1 }| ).
        ELSE.
                out->write( |Line with key { key2 } does not exist.| ).
        ENDIF.

        out->write( |\n| ).

        IF idx_of_line2 <> 0.
                out->write( |Index of line with key { key3 }: { idx_of_line2 }| ).
        ELSE.
                out->write( |Line with key { key3 } does not exist.| ).
        ENDIF.

        out->write( |\n| ).

        IF tab_idx1 <> 0.
                out->write( |Index of line with key { key2 }: { tab_idx1 }| ).
        ELSE.
                out->write( |Line with key { key2 } does not exist.| ).
        ENDIF.

        out->write( |\n| ).

        IF tab_idx2 <> 0.
                out->write( |Index of line with key { key3 }: { tab_idx2 }| ).
        ELSE.
                out->write( |Line with key { key3 } does not exist.| ).
        ENDIF.

        out->write( |\n| ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `49) Checking how many lines are in an` && ` internal table` ) ).

        DATA(itab_lines) = lines( it_so_sec ).

        out->write( data = itab_lines name = `itab_lines` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Processing multiple internal table lines ` && `sequentially` ) ).
        out->write( |50) Reading a complete table by sequentially reading all lines\n\n| ).

        "No further addition: All lines are respected.
        LOOP AT it_so_sec ASSIGNING FIELDS-SYMBOL(<fs4>).
                <fs4>-b = 'ZZZ'.
        ENDLOOP.

        out->write( data = it_so_sec name = `it_so_sec` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading(  `51) LOOP AT statements with different targets` ) ).

        "The following examples demonstrate the different targets that
        "are possible for LOOP AT statements. In the example above,
        "a field symbol is created inline.
        "As above, there are no additions to the loop statement, i.e. all lines
        "are processed.

        DATA(lines_in_table) = lines(it_so_sec).
        out->write( |There should be { lines_in_table } interations per loop.| ).
        out->write( |\n| ).

        "Target: Existing work area
        out->write( `---- Target: Existing work area ----` ).
        out->write( |\n| ).
        DATA wa_lo LIKE LINE OF it_so_sec.

        LOOP AT it_so_sec INTO wa_lo.
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.

        out->write( |\n| ).
        out->write( `---- Loop target: Work area created inline ----` ).
        out->write( |\n| ).

        LOOP AT it_so_sec INTO DATA(wa_inl).
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.

        out->write( |\n| ).
        out->write( `---- Loop target: Existing field symbol ----` ).
        out->write( |\n| ).

        FIELD-SYMBOLS <fs_lo> LIKE LINE OF it_so_sec.
        LOOP AT it_so_sec ASSIGNING <fs_lo>.
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.

        out->write( |\n| ).
        out->write( `---- Loop target: Field symbol created inline ----` ).
        out->write( |\n| ).

        LOOP AT it_so_sec ASSIGNING FIELD-SYMBOL(<fs_inl>).
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.

        out->write( |\n| ).
        out->write( `---- Loop target: Existing data reference variable ----` ).
        out->write( |\n| ).

        DATA dref_lo TYPE REF INTO struc1.
        LOOP AT it_so_sec REFERENCE INTO dref_lo.
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.

        out->write( |\n| ).
        out->write( `---- Loop target: Data reference variable created inline ----` ).
        out->write( |\n| ).

        LOOP AT it_so_sec REFERENCE INTO DATA(dref_inl).
                IF sy-tabix = 1.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ELSEIF sy-tabix = lines_in_table.
                        out->write( |This text is displayed when reaching line { sy-tabix }.| ).
                ENDIF.
        ENDLOOP.


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `52) Reading multiple lines by an index range` ) ).

        "Specific lines in an index range are respected
        "Note: FROM/TO alone can specified, too.
        LOOP AT it_so_sec ASSIGNING FIELD-SYMBOL(<fs5>) FROM 2 TO 3.
                <fs5>-c = '###'.
        ENDLOOP.

        out->write( data = it_so_sec name = `it_so_sec` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `53) Reading multiple lines by condition` ) ).

        LOOP AT it_so_sec ASSIGNING FIELD-SYMBOL(<fs6>) WHERE a < 3.
                <fs6>-d = 'XXX'.
        ENDLOOP.

        out->write( data = it_so_sec name = `it_so_sec` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `54) Looping across a table without an interest` && ` in the table content` ) ).

        LOOP AT it_so_sec TRANSPORTING NO FIELDS a < 3.
                DATA(num) = sy-tabix.
        ENDLOOP.

        out->write( |There are { num } lines in the fulfilling the condition| ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `55) Loop with table key specification` ) ).

        DATA it_st_em TYPE TABLE OF struc1 WITH EMPTY KEY.

        "Looping across hashed table using a secondary key. The loop starts
        "according to the secondary table index. The lines are added to
        "another internal table having a matching type. It basically
        "visualizes the order of the table lines in the secondary table
        "index.
        LOOP AT it_ha_sec ASSIGNING FIELD-SYMBOL(<fs7>) USING KEY sec_key_h.
                APPEND <fs7> TO it_st_em.
        ENDLOOP.

        out->write( data = it_st_em name = `it_st_em` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `STEP addition in LOOP AT statements` ) ).
        out->write( |56) Reversing loop order\n\n| ).

        DATA(it_abc) = VALUE string_table( ( `a` ) ( `b` ) ( `c` ) ( `d` ) ( `e` ) ( `f` ) ).

        DATA it_abc_result TYPE string_table.

        "Reversing the loop order with the addition STEP
        "Each line is read indicated by absolute value 1
        LOOP AT it_abc ASSIGNING FIELD-SYMBOL(<step>) STEP -1.
                APPEND <step> TO it_abc_result.
        ENDLOOP.

        out->write( data = it_abc_result name = `it_abc_result` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `57) Forward loop and defining step size` ) ).

        "Forward loop indicated by positive integer, every second line is processed
        CLEAR it_abc_result.
        LOOP AT it_abc ASSIGNING FIELD-SYMBOL(<sec>) STEP 2.
                APPEND <sec> TO it_abc_result.
        ENDLOOP.

        out->write( data = it_abc_result name = `it_abc_result` ).


**********************************************************************
**********************************************************************


**********************************************************************

        out->write( zcl_demo_abap_aux=>heading( `58) STEP addition combined with FROM/TO` ) ).

        "Combining the STEP addition with other additions, e.g. FROM and TO
        "Note: If the value after STEP is negative, the value after FROM
        "must be greater than the value after TO.
        CLEAR it_abc_result.
        LOOP AT it_abc ASSIGNING FIELD-SYMBOL(<from_to>) FROM 6 TO 3 STEP -2.
                APPEND <from_to> TO it_abc_result.
        ENDLOOP.

        out->write( data = it_abc_result name = `it_abc_result` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `Creating and filling tables using table ` && `iterations with FOR and VALUE` ) ).
        out->write( |59) Retrieving values of one column in an internal table.\n\n| ).

        "Creating internal table type 
        TYPES ty_numbers TYPE TABLE OF i WITH EMPTY KEY.

        "Table comprehension: Content of an internal table is created by
        "evaluating a table using a table iteration with an iteration
        "expressions within a constructor expression.
        DATA(lv_num_a) = VALUE ty_numbers( FOR ls1 IN it_ha_sec ( ls1-a ) ).

        out->write( data = lv_num_a name = `lv_num_a` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `60) Retrieving values of one column in ` && `an internal table based on conditions` ) ).

        "Internal table type
        TYPES tabtype LIKE it_so_sec.

        DATA(lv_num_b) = VALUE ty_numbers( FOR ls2 IN it_ha_sec
        WHERE ( a < 3 ) ( ls2-a ) ).

        out->write( data = lv_num_b name = `lv_num_b` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `61) Looping across 2 tables ` && `and retrieving values based on conditions` ) ).
        "Internal table type
        TYPES tabtype LIKE it_so_sec.

        DATA(itab_for_2tab) = 
                VALUE tabtype(
                                FOR ls3 IN it_ha_sec
                                FOR ls4 IN it_so_sec WHERE ( a = ls3-a )
                                                           ( a = ls3-a b = ls4-b c = ls3-c d = ls4-d ) ).

        out->write( data = itab_for_2tab name = `itab_for_2tab` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `62) Retrieving and changing values from an ` && `internal tables sequentially` ) ).

        DATA(it_changed) = VALUE tabtype( FOR ls5 IN it_so_sec 
                                        ( a = ls5-a b = 'WWW' c = 'VVV' d = 'UUU' ) ).

        out->write( data = it_changed name = `it_changed` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `63) Sorting internal tables` ) ).

        "Creating structured data types
        TYPES: BEGIN OF s1,
                a TYPE i,
                b TYPE string,
                c TYPE c LENGTH 1,
                d TYPE i,
               END OF s1.

        TYPES: BEGIN OF s2,
                a TYPE i,
                b TYPE i,
               END OF s2.

        "Creating internal tables
        DATA it1 TYPE TABLE OF s1 WITH NON-UNIQUE KEY a.
        DATA it2 TYPE TABLE OF s2 WITH DEFAULT KEY.

        "Filling internal tables
        it1 = VALUE #( ( a = 1 b = `c` c = 'z' d = 4 )
                       ( a = 2 b = `b` c = 'y' d = 3 )
                       ( a = 3 b = `a` c = 'x' d = 2 )
                       ( a = 4 b = `d` c = 'w' d = 1 )
                       ( a = 5 b = `e` c = 'v' d = 0 )
                       ( a = 6 b = `f` c = 'u' d = 9 )
                       ( a = 7 b = `g` c = 't' d = 8 )
                       ( a = 8 b = `h` c = 's' d = 7 )
                       ( a = 9 b = `i` c = 'r' d = 6 )
                       ( a = 10 b = `j` c = 'q' d = 5 ) ).

        it2 = it1.

        out->write( `Origin internal table content ` && `(it1 and it2 have the same content)` ).
        out->write( |\n| ).
        out->write( |\n| ).
        out->write( data = it1 name = `it1` ).
        out->write( |\n| ).
        out->write( data = it2 name = `it2` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `64) Sorting by primary table key` ) ).

        "Primary key: component a
        SORT it1.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `65) Sorting by primary table key in ascending` && ` order` ) ).

        "The sorting result is the same as above (where ASCENDING is used
        "implicitly). Here, it is explicitly specified.
        SORT it1 ASCENDING.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `66) Sorting by primary table key respecting all ` && `non-numeric fields` ) ).

        "Primary key: standard table key (all non-numeric fields)
        SORT it2.

        out->write( data = it2 name = `it2` ).

        "The following code is commented out on purpose because it
        "produces a syntax warning. The primary table key is empty.
        "A sorting has no effect.
        "SORT it3.
        "out->write( data = it3 name = `it3` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `67) Sorting by primary table key in ` && `descending order` ) ).

        "Sorting in descending order and by primary table key
        SORT it1 DESCENDING.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `68) Sorting by explicitly specified component (1)` ) ).
        "Here, the component is the primary table key.
        "The sorting result is the same as above.
        SORT it1 BY a DESCENDING.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `69) Sorting by explicitly specified component (2)` ) ).

        "Sorting by arbitrary, non-key field
        SORT it1 BY d DESCENDING.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************


        out->write( zcl_demo_abap_aux=>heading( `70) Sorting by multiple explicitly specified` && ` components` ) ).

        "Sorting by multiple components and specifying the sort order
        SORT it1 BY b ASCENDING c DESCENDING.

        out->write( data = it1 name = `it1` ).


**********************************************************************
**********************************************************************